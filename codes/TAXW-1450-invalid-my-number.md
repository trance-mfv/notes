You're right about the existing error handling mechanism. Instead of adding a custom validation directly in the `save` method, we can leverage the existing error handling structure with `ArgumentError`. This approach would be more consistent with the current codebase.

Here's how we can modify the code:

```ruby:app/forms/year_end_tax_adjustment/steps/personal/business_information_form.rb
# ... existing code ...
def save
  TaBase.transaction do
    if declaration_of_employee_attributes
      # Validate my_number format if present
      if declaration_of_employee_attributes[:my_number].present?
        validate_my_number!(declaration_of_employee_attributes[:my_number])
      else
        declaration_of_employee_attributes[:my_number] = nil
      end

      # ... existing code for updating tax_adjustment_employee_attributes ...
    end
    
    # ... rest of the existing code ...
  end

  true
rescue ArgumentError, ActiveRecord::RecordInvalid => e
  # Check if this is a my_number validation error
  if e.message.include?('invalid_my_number_format') || e.message.include?('my_number')
    errors.add(:my_number, e.message)
  else
    errors.add(:base, e.message)
  end
  
  false
end

private

def validate_my_number!(number)
  # Check if my_number is exactly 12 digits
  unless number.to_s.match?(/\A\d{12}\z/)
    raise ArgumentError, I18n.t('errors.messages.invalid_my_number_format')
  end
end
# ... existing code ...
```

This approach:

1. Adds a `validate_my_number!` method that raises an `ArgumentError` if the format is invalid
2. Calls this validation method before processing the `my_number` attribute
3. Utilizes the existing error handling mechanism in the `rescue` block
4. Maintains the current pattern of the codebase

The error message will be caught by the existing rescue block and added to the form's errors collection, which will then be displayed to the user when the form is rendered again.

This is a cleaner approach that follows the existing error handling pattern in your codebase while ensuring the `my_number` attribute meets the required format.
