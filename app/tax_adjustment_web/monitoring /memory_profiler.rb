require 'memory_profiler'

def profile_memory_usage
  report = MemoryProfiler.report do
    Employee.select("office_id, GROUP_CONCAT(DISTINCT id ORDER BY id DESC SEPARATOR ' ') AS employee_ids")
            .group(:office_id)
            .to_a
  end
  
  Rails.logger.info "Memory Profiler Report:"
  Rails.logger.info "  - Total allocated: #{report.total_allocated} bytes"
  Rails.logger.info "  - Total retained: #{report.total_retained} bytes"
  Rails.logger.info "  - Allocated objects: #{report.total_allocated_objects}"
  Rails.logger.info "  - Retained objects: #{report.total_retained_objects}"
  
  # Save detailed report to file
  File.write('tmp/memory_profile.txt', report.pretty_print)
end