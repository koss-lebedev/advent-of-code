counter = 0

File.readlines('./input.txt').each do |line|
  sides = line.split(' ').map(&:to_i).sort
  largest = sides.pop
  counter += 1 if sides.inject(:+) > largest
end

puts counter