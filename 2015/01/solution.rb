floor = 0
File.read('./input.txt').split('').each do |char|
  floor += (char == '(' ? 1 : -1)
end

puts floor