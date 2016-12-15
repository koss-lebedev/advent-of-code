total = 0
File.readlines('./input.txt').each do |line|
  dims = line.split('x').map(&:to_i).sort
  total += 2*dims[0] + 2*dims[1] + dims.inject(:*)
end

puts total