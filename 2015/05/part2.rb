count = 0

File.readlines('./input.txt').each do |line|

  first_match = line.match /(\w{2})\w*\1/
  second_match = line.match /(\w)\w\1/

  count += 1 if first_match && second_match
end

puts count