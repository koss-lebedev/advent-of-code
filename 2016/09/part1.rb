length = 0

File.readlines('./input.txt').each do |line|

  i = 0
  while i < line.size
    if line[i] == '('
      j = i+1
      while line[j] != ')'
        j += 1
      end

      matches = line[i..j].match(/(?<a>\d+)x(?<b>\d+)/)
      a , b = matches[:a].to_i, matches[:b].to_i
      length += a * b

      i = j + a + 1
    else
      length += 1
      i += 1
    end
  end

end

puts length