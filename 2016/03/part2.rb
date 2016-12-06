counter = 0
cursor = 0
coords = [[],[],[]]

File.readlines('./input.txt').each do |line|
  line.split(' ').map(&:to_i).each_with_index do |item, index|
    coords[index] << item
  end
  cursor += 1

  if cursor == 3
    coords.each do |coord|
      largest = coord.sort!.pop
      counter += 1 if coord.inject(:+) > largest
    end

    cursor = 0
    coords = [[],[],[]]
  end

end

puts counter