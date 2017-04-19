ranges = File.readlines('./input.txt').map do |line|
  line.split('-').map(&:to_i)
end

ranges.sort_by! { |range| range[0] }
main_range = [0,0]

first_match = nil
total = 0

ranges.each do |range|
  if range[0] > main_range[1] + 1
    first_match = range[0] - 1 unless first_match
    total += range[0] - main_range[1] - 1
  end
  main_range[1] = range[1] if range[1] > main_range[1]
end

total += 4294967295 - main_range[1]

puts first_match
puts total