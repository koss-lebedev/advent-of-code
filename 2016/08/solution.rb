class Puzzle

  ROWS = 6
  COLUMNS = 50

  def initialize(lines)
    @lines = lines
    @arr = []
    ROWS.times do |row|
      arr[row] = (0...COLUMNS).map { 0 }
    end
  end

  def solve
    lines.each do |line|
      if line.start_with?('rect')
        matches = line.match(/(?<a>\d+)x(?<b>\d+)/)
        set_pixels matches[:a].to_i, matches[:b].to_i
      else
        matches = line.match(/(?<dir>\w{1})=(?<index>\d+)\sby\s(?<count>\d+)/)
        if matches[:dir] == 'x'
          rotate_column(matches[:index].to_i, matches[:count].to_i)
        else
          rotate_row(matches[:index].to_i, matches[:count].to_i)
        end
      end
    end
  end

  def pixels_lit
    arr.map { |r| r.count { |i| i == 1 } }.reduce(:+)
  end

  def print
    arr.each do |row|
      puts row.map{ |n| n == 0 ? ' ' : "\u25A0" }.join
    end
  end

private

  attr_reader :arr, :lines

  def set_pixels(a, b)
    b.times do |row|
      a.times do |col|
        arr[row][col] = 1
      end
    end
  end

  def reverse_column(from, to, index)
    while from < to
      temp = arr[from][index]
      arr[from][index] = arr[to][index]
      arr[to][index] = temp
      from += 1
      to -= 1
    end
  end

  def reverse_row(from, to, index)
    while from < to
      temp = arr[index][from]
      arr[index][from] = arr[index][to]
      arr[index][to] = temp
      from += 1
      to -= 1
    end
  end

  def rotate_column(index, count)
    k = count % ROWS
    if k > 0
      reverse_column(0, ROWS-1, index)
      reverse_column(0, k-1, index)
      reverse_column(k, ROWS-1, index)
    end
  end

  def rotate_row(index, count)
    k = count % COLUMNS
    if k > 0
      reverse_row(0, COLUMNS-1, index)
      reverse_row(0, k-1, index)
      reverse_row(k, COLUMNS-1, index)
    end
  end

end

puzzle = Puzzle.new File.readlines('./input.txt')

puzzle.solve

# part 1
puts puzzle.pixels_lit

# part 2
puzzle.print

