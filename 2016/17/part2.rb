require 'digest'

class Point < Struct.new(:x, :y, :path);
  def ==(other)
    x == other.x && y == other.y
  end
end

def possible_moves(point, code)
  moves = []

  dirs = Digest::MD5.hexdigest(code + point.path)[0...4].chars.map { |char| char.ord > 97 ? true : false }

  if dirs[1] && point.y < 3
    moves << Point.new(point.x, point.y + 1, point.path + ?D)
  end
  if dirs[3] && point.x < 3
    moves << Point.new(point.x + 1, point.y, point.path + ?R)
  end
  if dirs[0] && point.y > 0
    moves << Point.new(point.x, point.y - 1, point.path + ?U)
  end
  if dirs[2] && point.x > 0
    moves << Point.new(point.x - 1, point.y, point.path + ?L)
  end

  moves
end

longest = ''
code = 'ihgpwlah'.freeze
queue = [Point.new(0, 0, '')]
dest = Point.new(3,3, nil)

until queue.empty?
  current = queue.shift

  if current == dest && current.path.size > longest.size
    longest = current.path
  else
    possible_moves(current, code).each { |move| queue << move }
  end

end

puts longest