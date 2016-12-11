class Puzzle

  def initialize(input)
    @input = input
    @coordinates = Hash.new { |h,k| h[k] = [] }
  end

  def solve
    dir = :n
    dir_map = { n: %i(w e), e: %i(n s), s: %i(e w), w: %i(s n) }

    x, y = 0, 0

    coordinates[x] << y
    step = 0

    catch(:found) do
      input.split(', ').each do |point|
        turn = point.slice!(0)
        delta = point.to_i

        dir = dir_map[dir][turn == 'L' ? 0 : 1]

        case dir
          when :n
            delta.times do |i|
              y += 1
              throw(:found) if point_visited?(x, y)
            end
          when :s
            delta.times do |i|
              y -= 1
              throw(:found) if point_visited?(x, y)
            end
          when :e
            delta.times do |i|
              x += 1
              throw(:found) if point_visited?(x, y)
            end
          when :w
            delta.times do |i|
              x -= 1
              throw(:found) if point_visited?(x, y)
            end
        end

        step += 1
      end
    end
  end

private

  attr_reader :input, :coordinates

  def point_visited?(x, y)
    if coordinates[x].include?(y)
      puts x.abs + y.abs
      true
    else
      coordinates[x] << y
      false
    end
  end

end

puzzle = Puzzle.new File.read('./input.txt')
puzzle.solve