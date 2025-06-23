class QueryPerformanceMonitor
  def self.monitor_query(query_name = "Unknown Query", &block)
    # Initial measurements
    initial_memory = get_memory_usage
    initial_objects = ObjectSpace.count_objects[:T_OBJECT]
    initial_gc_count = GC.stat[:count]
    
    result = nil
    execution_time = Benchmark.measure do
      result = yield
    end
    
    # Final measurements
    final_memory = get_memory_usage
    final_objects = ObjectSpace.count_objects[:T_OBJECT]
    final_gc_count = GC.stat[:count]
    
    # Calculate metrics
    memory_increase = final_memory - initial_memory
    objects_created = final_objects - initial_objects
    gc_runs = final_gc_count - initial_gc_count
    
    # Log comprehensive metrics
    Rails.logger.info "=" * 60
    Rails.logger.info "Query Performance Report: #{query_name}"
    Rails.logger.info "=" * 60
    Rails.logger.info "Time Metrics:"
    Rails.logger.info "  - Real Time: #{execution_time.real.round(3)}s"
    Rails.logger.info "  - User CPU: #{execution_time.utime.round(3)}s"
    Rails.logger.info "  - System CPU: #{execution_time.stime.round(3)}s"
    Rails.logger.info "Memory Metrics:"
    Rails.logger.info "  - Initial Memory: #{initial_memory.round(2)} MB"
    Rails.logger.info "  - Final Memory: #{final_memory.round(2)} MB"
    Rails.logger.info "  - Memory Increase: #{memory_increase.round(2)} MB"
    Rails.logger.info "Object Metrics:"
    Rails.logger.info "  - Objects Created: #{objects_created}"
    Rails.logger.info "  - GC Runs: #{gc_runs}"
    Rails.logger.info "Result Metrics:"
    Rails.logger.info "  - Records Returned: #{result.respond_to?(:count) ? result.count : 'N/A'}"
    Rails.logger.info "  - Memory per Record: #{result.respond_to?(:count) && result.count > 0 ? (memory_increase / result.count).round(6) : 'N/A'} MB"
    Rails.logger.info "=" * 60
    
    result
  end
  
  private
  
  def self.get_memory_usage
    `ps -o pid,rss -p #{Process.pid}`.split("\n")[1].split.last.to_f / 1024
  end
end