count = 0

File.readlines('./input.txt').each do |line|

  first_match = line.scan /[aeiou]/
  second_match = line.scan /(\w)\1+/
  third_match = line.scan /(ab|cd|pq|xy)/

  if first_match.size > 2 && second_match.size > 0 && third_match.size == 0
    count += 1
  end
end

puts count