input = File.read('./input.txt')

sum, delta = 0, input.size / 2

input.chars.each_with_index do |chr, i|
  sum += chr.to_i if chr == input[(i + delta) % input.size]
end

puts sum
