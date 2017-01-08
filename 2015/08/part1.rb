input = File.readlines('input.txt')

size = 0

input.each do |line|
  size += line.size
  size -= line.gsub(/\\("|\\|x[0-9a-fA-F]{2})/, 'x').size - 2
end

puts size