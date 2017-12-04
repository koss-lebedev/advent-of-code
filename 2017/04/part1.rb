count = 0

File.readlines('./input.txt').each do |line|
  words = line.split(' ')
  count += 1 if words.size == words.uniq.size
end

puts count