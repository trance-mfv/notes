require 'objspace'

def detailed_memory_monitoring
  # Enable ObjectSpace statistics
  ObjectSpace.trace_object_allocations_start
  
  initial_stats = {
    objects: ObjectSpace.count_objects,
    memory: get_memory_usage,
    gc_stats: GC.stat
  }
  
  result = nil
  execution_time = Benchmark.measure do
    result = Employee.select("office_id, GROUP_CONCAT(DISTINCT id ORDER BY id DESC SEPARATOR ' ') AS employee_ids")
                     .group(:office_id)
                     .to_a
  end
  
  final_stats = {
    objects: ObjectSpace.count_objects,
    memory: get_memory_usage,
    gc_stats: GC.stat
  }
  
  # Calculate differences
  memory_diff = final_stats[:memory] - initial_stats[:memory]
  objects_diff = final_stats[:objects][:T_OBJECT] - initial_stats[:objects][:T_OBJECT]
  gc_runs = final_stats[:gc_stats][:count] - initial_stats[:gc_stats][:count]
  
  Rails.logger.info "Detailed Performance Metrics:"
  Rails.logger.info "  - Execution Time: #{execution_time.real.round(3)}s"
  Rails.logger.info "  - Memory Increase: #{memory_diff.round(2)} MB"
  Rails.logger.info "  - Objects Created: #{objects_diff}"
  Rails.logger.info "  - GC Runs: #{gc_runs}"
  Rails.logger.info "  - Records: #{result.count}"
  
  ObjectSpace.trace_object_allocations_stop
  result
end

def monitor_database_memory
  # Monitor database connection pool
  pool_stats = ActiveRecord::Base.connection_pool.stat
  
  Rails.logger.info "Database Connection Pool Stats:"
  Rails.logger.info "  - Size: #{pool_stats[:size]}"
  Rails.logger.info "  - Checked out: #{pool_stats[:checked_out]}"
  Rails.logger.info "  - Available: #{pool_stats[:available]}"
  
  # Monitor active connections
  ActiveRecord::Base.connection_pool.with_connection do |conn|
    Rails.logger.info "Active Database Connections: #{ActiveRecord::Base.connection_pool.connections.count}"
  end
end

def memory_efficient_query_processing
  initial_memory = get_memory_usage
  record_count = 0
  
  execution_time = Benchmark.measure do
    # Process in batches to control memory usage
    Employee.select("office_id, GROUP_CONCAT(DISTINCT id ORDER BY id DESC SEPARATOR ' ') AS employee_ids")
            .group(:office_id)
            .find_in_batches(batch_size: 1000) do |batch|
              
      batch_memory = get_memory_usage
      Rails.logger.debug "Processing batch of #{batch.size} records, Memory: #{batch_memory.round(2)} MB"
      
      # Process each office result
      batch.each do |office_result|
        record_count += 1
        process_office_employees(office_result.office_id, office_result.employee_ids)
      end
      
      # Force garbage collection after each batch
      GC.start
    end
  end
  
  final_memory = get_memory_usage
  memory_increase = final_memory - initial_memory
  
  Rails.logger.info "Batch Processing Metrics:"
  Rails.logger.info "  - Total Time: #{execution_time.real.round(3)}s"
  Rails.logger.info "  - Memory Increase: #{memory_increase.round(2)} MB"
  Rails.logger.info "  - Records Processed: #{record_count}"
  Rails.logger.info "  - Avg Memory per Record: #{(memory_increase / record_count).round(4)} MB"
end

private

def process_office_employees(office_id, employee_ids)
  # Your processing logic here
  # Keep this lightweight to minimize memory usage
end