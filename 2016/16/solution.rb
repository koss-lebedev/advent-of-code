def expand_data(input, length)
  if input.size >= length
    input[0...length]
  else
    b = input.reverse.chars.map{ |c| c == ?0 ? ?1 : ?0 }.join
    expand_data "#{input}0#{b}", length
  end
end

def checksum(input)
  if input.size.odd?
    input
  else
    checksum input.chars.each_slice(2).map { |a, b| a == b ? ?1 : ?0 }.join
  end
end

expanded = expand_data '01111010110010011', 272
result = checksum expanded

puts result

# expanded = expand_data '01111010110010011', 35651584
# result = checksum expanded
#
# puts result

