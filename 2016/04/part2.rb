def caesar_decode(str, n)
  shift = n % 26
  decoded = str.split('').map do |char|
    if char == '-'
      ' '
    else
      code = char.ord + shift
      ((code < 123) ? code : (97 + code - 123)).chr
    end
  end

  decoded.join
end

File.readlines('./input.txt').each do |line|

  matches = line.match(/(?<name>[^\d]+)(?<sector_id>\d+)\[(?<checksum>\w+)\]/)

  if caesar_decode(matches[:name],matches[:sector_id].to_i) == 'northpole object storage '
    puts matches[:sector_id]
  end

end


