line = File.read('./input.txt')

def unpacked_length(line)
  length = 0
  i = 0
  while i < line.size
    if line[i] == '('
      j = i+1
      while line[j] != ')'
        j += 1
      end

      matches = line[i..j].match(/(?<a>\d+)x(?<b>\d+)/)
      a , b = matches[:a].to_i, matches[:b].to_i

      if !!(line[j+1..j+a] =~ /\(\w+\)/)
        length += unpacked_length(line[j+1..j+a]) * b
      else
        length += a * b
      end

      i = j + a + 1
    else
      length += 1
      i += 1
    end
  end

  length
end

puts unpacked_length(line)
