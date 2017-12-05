input = 265149
dimension = Math.sqrt(input).ceil

grid = Array.new(dimension) { Array.new(dimension) }
start = dimension / 2
x = y = start
grid[y][x] = 1

dirs = [:right, :up, :left, :down]
dir = dirs[0]

def move(x, y, dir)
  case dir
  when :right then [x+1, y]
  when :up then [x, y-1]
  when :left then [x-1, y]
  when :down then [x, y+1]
  end
end

(input - 1).times do |i|
  next_dir = dirs[(dirs.index(dir) + 1) % dirs.length]
  x1, y1 = move(x, y, next_dir)
  dir = next_dir if grid[y1][x1].nil?

  x, y = move(x, y, dir)

  grid[y][x] = [
    grid[y-1][x-1], grid[y-1][x], grid[y-1][x+1],
    grid[y][x-1], grid[y][x+1],
    grid[y+1][x-1], grid[y+1][x], grid[y+1][x+1]
  ].compact.inject(0, :+)  

  break if grid[y][x] > input
end

puts grid[y][x]
