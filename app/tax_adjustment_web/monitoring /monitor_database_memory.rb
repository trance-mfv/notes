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