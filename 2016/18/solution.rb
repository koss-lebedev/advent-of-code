class Puzzle

  def initialize(input, rows)
    @prev = input.chars.map { |char| char == ?^ ? false : true }
    @cur = []
    @rows = rows
    @cols = input.size
  end

  def solve
    count = 0
    (rows).times do
      count += prev.count{ |tile| tile }
      cols.times do |col|
        left, center, right = (-1..1).map do |delta|
          (col+delta < 0 || col+delta > cols) ? true : prev[col+delta]
        end
        cur[col] = !trap?(left, center, right)
      end

      self.prev, self.cur = cur, prev
    end

    count
  end

private

  attr_accessor :prev, :cur, :rows, :cols

  def trap?(left, center, right)
    (left == false && center == false && right != false) ||
    (center == false && right == false && left != false) ||
    (left == false && center != false && right != false) ||
    (right == false && center != false && left != false)
  end

end

input = '.^^.^^^..^.^..^.^^.^^^^.^^.^^...^..^...^^^..^^...^..^^^^^^..^.^^^..^.^^^^.^^^.^...^^^.^^.^^^.^.^^.^.'

puts Puzzle.new(input, 40).solve      # 1951
puts Puzzle.new(input, 400_000).solve # 20002936


