data = []
8.times { data << Hash.new(0) }

File.readlines('./input.txt').each do |line|
  line.strip.each_char.with_index do |char, index|
    data[index][char] += 1
  end
end

puts data.map { |hash| hash.sort_by { |k, v| -v }[0][0] }.join