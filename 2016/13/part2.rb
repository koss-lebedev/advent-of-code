class Puzzle

  def initialize(seed, dx, dy)
    @seed = seed
    @dest = Point.new(dx, dy, 0)
    @visited = []
  end

  def solve
    queue = [Point.new(1, 1, 0)]

    until queue.empty?
      current = queue.shift
      return visited.size if current.distance == 50

      moves = []
      moves << Point.new(current.x, current.y+1, current.distance + 1)
      moves << Point.new(current.x+1, current.y, current.distance + 1)
      moves << Point.new(current.x, current.y-1, current.distance + 1) if current.y > 0
      moves << Point.new(current.x-1, current.y, current.distance + 1) if current.x > 0

      moves.each do |move|
        if open_space?(move.x, move.y) && !visited.include?(move)
          visited << move
          queue.push move
        end
      end
    end
  end

private

  attr_reader :seed, :dest, :visited

  def open_space?(x, y)
    ((x*x + 3*x + 2*x*y + y + y*y) + seed).to_s(2).split('').map(&:to_i).reject(&:zero?).count.even?
  end

  class Point < Struct.new(:x, :y, :distance)
    def ==(other)
      x == other.x && y == other.y
    end
  end

end

puts Puzzle.new(1350, 31, 39).solve
