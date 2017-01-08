input = File.readlines('input.txt')

size = 0

input.each do |line|
  size += line.gsub(/(\\|\")/, 'xx').size + 2
  size -= line.size
end

puts size