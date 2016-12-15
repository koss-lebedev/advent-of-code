total = 0
File.readlines('./input.txt').each do |line|
  dims = line.split('x').map(&:to_i).sort
  total += 2*dims[0]*dims[1] + 2*dims[1]*dims[2] + 2*dims[2]*dims[0] +
      dims[0]*dims[1]
end

puts total