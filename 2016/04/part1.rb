sum = 0

File.readlines('./input.txt').each do |line|
  matches = line.match(/(?<name>[^\d]+)(?<sector_id>\d+)\[(?<checksum>\w+)\]/)
  freq = Hash.new(0)
  matches[:name].gsub('-', '').each_char do |char|
    freq[char] += 1
  end

  name = freq.sort_by { |k,v| [-v, k] }.map{ |a| a[0] }.join
  sum += matches[:sector_id].to_i if name.start_with?(matches[:checksum])
end

puts sum