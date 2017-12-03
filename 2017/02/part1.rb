sum = 0
File.readlines('./input.txt').each do |line|
  nums = line.split(' ').map(&:to_i).sort
  sum += nums.last - nums.first
end

puts sum