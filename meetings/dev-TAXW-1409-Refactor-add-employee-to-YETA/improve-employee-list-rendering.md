## Improving Rails/Slim Rendering Performance Without Pagination

If pagination isn't an option at this stage of development, there are still several approaches to improve the rendering performance of your large employee list:

### 1. Partial Rendering with Streaming

Rails supports streaming responses, which can start sending parts of the page to the browser before the entire page is rendered:

```ruby:app/controllers/office_members_controller.rb
def index
  @result = Employee.all # or your current query
  
  # Enable streaming
  response.headers["Cache-Control"] = "no-cache"
  response.headers["X-Accel-Buffering"] = "no"
  
  self.response_body = Enumerator.new do |y|
    y << render_to_string(partial: 'list_header')
    
    @result.find_each(batch_size: 100) do |batch|
      y << render_to_string(partial: 'employee_batch', locals: { employees: batch, f: nil })
    end
    
    y << render_to_string(partial: 'list_footer')
  end
end
```

Then split your current `_list.html.slim` into three partials:

### 2. Optimize Database Queries

Ensure you're using efficient queries and eager loading to avoid N+1 queries:

```ruby
@result = Employee.includes(:office_authority_pattern, :user).all
```

### 3. Fragment Caching

Even without pagination, you can use fragment caching to speed up rendering:

```slim:app/views/office_members/_list.html.slim
- if @result.empty?
  = render 'shared/no_result_filter_template'

- else
  .mf-mb10
    .ct-row.mt-2.pl-3.pr-3.position-relative
      table.table.hover.custom-table.table-office-member
        // ... existing code ...

        tbody
          - @result.each do |item|
            - cache [item, 'office_member_list'] do
              - if item.is_a? Employee
                = render partial: "employee", locals: { employee: item, f: f }
              - else
                = render partial: "office_member", locals: { office_member: item, f: f }
```

### 4. Turbo Frames with Progressive Loading

You can use Turbo Frames to load the table in chunks after the initial page load:

```slim:app/views/office_members/_list.html.slim
- if @result.empty?
  = render 'shared/no_result_filter_template'

- else
  .mf-mb10
    .ct-row.mt-2.pl-3.pr-3.position-relative
      table.table.hover.custom-table.table-office-member
        // ... existing table header code ...
        
        tbody#employee-list
          = turbo_frame_tag "employees-chunk-1" do
            = render partial: "employee_chunk", locals: { chunk_number: 1, f: f }
```

Then create a controller action to load chunks:

```ruby:app/controllers/office_members_controller.rb
def load_chunk
  chunk_number = params[:chunk_number].to_i
  chunk_size = 100
  offset = (chunk_number - 1) * chunk_size
  
  @employees = Employee.offset(offset).limit(chunk_size)
  
  render partial: "employee_chunk", locals: { 
    chunk_number: chunk_number,
    employees: @employees,
    f: nil
  }
end
```

### 5. Use Asynchronous JavaScript Loading

Load the employee data via AJAX after the page loads:

```slim:app/views/office_members/_list.html.slim
- if @result.empty?
  = render 'shared/no_result_filter_template'

- else
  .mf-mb10
    .ct-row.mt-2.pl-3.pr-3.position-relative
      table.table.hover.custom-table.table-office-member
        // ... existing table header code ...
        
        tbody#employee-list
          // Will be populated via JavaScript
          
javascript:
  document.addEventListener('DOMContentLoaded', function() {
    fetch('/office_employees/load_data')
      .then(response => response.text())
      .then(html => {
        document.getElementById('employee-list').innerHTML = html;
      });
  });
```

### 6. Server-Side Optimization

Optimize your server configuration:

1. Increase the number of worker processes/threads
2. Increase the timeout settings
3. Use a faster server like Puma in clustered mode

### 7. Use a Background Job to Prepare Data

If the data requires complex processing, use a background job to prepare the data and store it in a cache or temporary table:

```ruby:app/jobs/prepare_employee_list_job.rb
class PrepareEmployeeListJob < ApplicationJob
  def perform(user_id)
    # Process and prepare employee data
    # Store in Redis or a temporary table
    Rails.cache.write("employee_list_#{user_id}", processed_data, expires_in: 1.hour)
  end
end
```

Then in your controller:

```ruby:app/controllers/office_members_controller.rb
def index
  @result = Rails.cache.fetch("employee_list_#{current_user.id}") do
    # If cache miss, trigger background job and return a smaller subset for now
    PrepareEmployeeListJob.perform_later(current_user.id)
    Employee.limit(100) # Show first 100 while the full list is being prepared
  end
end
```

### 8. Use View Component for More Efficient Rendering

Replace your partials with ViewComponents which can be more efficient:

```ruby:app/components/employee_row_component.rb
class EmployeeRowComponent < ViewComponent::Base
  def initialize(employee:, f:)
    @employee = employee
    @f = f
  end
end
```

## Improving Rails/Slim Rendering Performance for Large Lists

Rendering 10K employees in 7 seconds is definitely slow. Here are several approaches to improve the performance:

### 1. Implement Pagination

You're already using pagination based on the code, but make sure it's configured with a reasonable page size (e.g., 25-50 items per page) to avoid rendering thousands of records at once.

### 2. Use Infinite Scrolling or Lazy Loading

Instead of traditional pagination, implement infinite scrolling or lazy loading to load employees as the user scrolls down.

```ruby:app/controllers/office_members_controller.rb
def index
  @page = params[:page] || 1
  @per_page = 50
  @result = Employee.page(@page).per(@per_page)
  
  if request.xhr?
    render partial: 'employee_rows', locals: { employees: @result, f: nil }
  end
end
```

Then create a partial for just the rows:

```slim:app/views/office_members/_employee_rows.html.slim
- employees.each do |item|
  - if item.is_a? Employee
    = render partial: "employee", locals: { employee: item, f: f }
  - else
    = render partial: "office_member", locals: { office_member: item, f: f }
```

### 3. Use Fragment Caching

Implement fragment caching to cache rendered employee rows:

```slim:app/views/office_members/_list.html.slim
- if @result.empty?
  = render 'shared/no_result_filter_template'

- else
  .mf-mb10
    .ct-row.mt-2.pl-3.pr-3.position-relative
      table.table.hover.custom-table.table-office-member
        // ... existing code ...

        tbody
          - @result.each do |item|
            - cache [item, 'office_member_list'] do
              - if item.is_a? Employee
                = render partial: "employee", locals: { employee: item, f: f }
              - else
                = render partial: "office_member", locals: { office_member: item, f: f }
```

### 4. Use Turbo Frames or Hotwire (if on Rails 7+)

Implement Turbo Frames to load parts of the page asynchronously.

### 5. Optimize Database Queries

Ensure you're using eager loading to avoid N+1 queries:

```ruby:app/controllers/office_members_controller.rb
# Instead of:
@result = Employee.page(@page).per(@per_page)

# Use:
@result = Employee.includes(:office_authority_pattern, :user).page(@page).per(@per_page)
```

### 6. Use Faster Template Engine

Consider using a faster template engine like HAML or ERB instead of Slim for performance-critical views.

### 7. Use Turbo-Rails or StimulusReflex for Real-time Updates

For a more modern approach, consider using Turbo-Rails or StimulusReflex to handle real-time updates without full page reloads.

### 8. Implement Virtual Scrolling

For extremely large lists, virtual scrolling only renders the visible items in the viewport:

```javascript:app/javascript/controllers/virtual_scroll_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container", "item"]
  
  connect() {
    this.setupVirtualScroll()
  }
  
  setupVirtualScroll() {
    // Implementation of virtual scrolling
  }
}
```

### 9. Use Background Jobs for Data Preparation

If the data requires complex processing, use background jobs to prepare the data before rendering.

### 10. Consider Using a JavaScript Framework for the List

For extremely large lists, consider using a JavaScript framework like React, Vue, or Alpine.js with efficient list rendering capabilities.

## References

- Slow performance when rendering collections of nested partials [#41452](https://github.com/rails/rails/issues/41452)