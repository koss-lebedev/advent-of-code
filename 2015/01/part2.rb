floor = 0
File.read('./input.txt').split('').each_with_index do |char, index|
  floor += (char == '(' ? 1 : -1)
  if floor == -1
    puts index + 1
    break
  end
end

