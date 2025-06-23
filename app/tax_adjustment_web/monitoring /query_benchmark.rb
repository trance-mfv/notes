# Simple benchmark with memory tracking
require 'benchmark'

def get_memory_usage
  `ps -o pid,rss -p #{Process.pid}`.split("\n")[1].split.last.to_f / 1024
end

initial_memory = get_memory_usage
result = nil

time = Benchmark.measure do
  result = Employee.select(:office_id, :id).group(:office_id, :id).order(:office_id, :id).to_a
end

final_memory = get_memory_usage
memory_increase = final_memory - initial_memory

puts "Query Performance:"
puts "  - Time: #{time.real.round(3)}s"
puts "  - Memory Increase: #{memory_increase.round(2)} MB"
puts "  - Records: #{result.count}"
puts "  - Memory per Record: #{(memory_increase / result.count).round(6)} MB"