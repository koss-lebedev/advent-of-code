input = File.read('01/input.txt').split(', ')

# current_direction (n - north)
dir = :n

# map containing new directions after left or right turn
dir_map = { n: %i(w e), e: %i(n s), s: %i(e w), w: %i(s n) }

# start coordinates
x, y = 0, 0

input.each do |point|
  turn = point.slice!(0)
  delta = point.to_i

  # find the new direction
  dir = dir_map[dir][turn == 'L' ? 0 : 1]

  case dir
    when :n
      y += delta
    when :s
      y -= delta
    when :e
      x += delta
    when :w
      x -= delta
  end

end

# shortest distance is a sum of aboslute changes in x and y coordinates
puts x.abs + y.abs