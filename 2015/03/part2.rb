require 'set'

hash = Hash.new { |h, k| h[k] = Set.new }
hash[0] << 0
sx, sy = 0, 0
rx, ry = 0, 0

File.read('./input.txt').split('').each_with_index do |dir, index|
  dx, dy = 0, 0

  case dir
    when '<'
      dx = -1
    when '>'
      dx = 1
    when '^'
      dy = 1
    when 'v'
      dy = -1
  end

  if index % 2 == 0
    rx += dx
    ry += dy
    hash[rx] << ry
  else
    sx += dx
    sy += dy
    hash[sx] << sy
  end

end

puts hash.values.map(&:size).inject(:+)