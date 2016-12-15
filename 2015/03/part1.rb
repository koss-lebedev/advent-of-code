require 'set'

hash = Hash.new { |h, k| h[k] = Set.new }
hash[0] << 0
x, y = 0, 0

File.read('./input.txt').each_char do |dir|
  case dir
    when '<'
      x -= 1
    when '>'
      x += 1
    when '^'
      y += 1
    when 'v'
      y -= 1
  end

  hash[x] << y
end

puts hash.values.map(&:size).inject(:+)