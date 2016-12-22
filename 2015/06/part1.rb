class Puzzle

  def initialize
    @lights = []
    1000.times do |i|
      lights[i] = (0...1000).map { 0 }
    end
  end

  def solve(commands)
    commands.each do |command|
      if match = command.match(/\Aturn\soff\s(?<x1>\d+),(?<y1>\d+)\sthrough\s(?<x2>\d+),(?<y2>\d+)/)
        run_command(match) { 0 }
      elsif match = command.match(/\Aturn\son\s(?<x1>\d+),(?<y1>\d+)\sthrough\s(?<x2>\d+),(?<y2>\d+)/)
        run_command(match) { 1 }
      elsif match = command.match(/\Atoggle\s(?<x1>\d+),(?<y1>\d+)\sthrough\s(?<x2>\d+),(?<y2>\d+)/)
        run_command(match) { |light| light.zero? ? 1 : 0 }
      end
    end

    lights.map { |row| row.inject(&:+)}.inject(&:+)
  end

private

  attr_reader :lights

  def run_command(arguments)
    x1, x2, y1, y2 = [:x1, :x2, :y1, :y2].map { |m| arguments[m] }.map(&:to_i)
    (x1..x2).each do |i|
      (y1..y2).each do |j|
        lights[i][j] = yield(lights[i][j])
      end
    end
  end

end

commands = File.readlines('./input.txt')
puts Puzzle.new.solve commands
