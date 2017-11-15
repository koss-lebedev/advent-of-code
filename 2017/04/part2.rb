count = 0

File.readlines('./input.txt').each do |line|
  words = line.split(' ').map(&:chars).map(&:sort).map(&:join)
  count += 1 if words.size == words.uniq.size
end

puts count