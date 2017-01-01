class Puzzle

  def initialize
    @wires = Hash.new
  end

  def solve(commands, initial_state = {})
    prepare commands
    wires.merge! initial_state
    resolve 'a'
  end

private

  attr_reader :wires

  def prepare(commands)
    commands.each do |command|
      op, wire = command.split(' -> ').map(&:strip)
      wires[wire] = op
    end
  end

  def resolve(wire)
    Integer(wire)
  rescue
    case wires[wire]
      when /LSHIFT/
        a, b = wires[wire].split(' LSHIFT ')
        wires[wire] = resolve(a) << resolve(b)
      when /RSHIFT/
        a, b = wires[wire].split(' RSHIFT ')
        wires[wire] = resolve(a) >> resolve(b)
      when /AND/
        a, b = wires[wire].split(' AND ')
        wires[wire] = resolve(a) & resolve(b)
      when /OR/
        a, b = wires[wire].split(' OR ')
        wires[wire] = resolve(a) | resolve(b)
      when /NOT/
        a = wires[wire][4..-1]
        wires[wire] = resolve(a) ^ 0xFFFF
      else
        resolve(wires[wire])
    end
  end

end

part1 = Puzzle.new.solve File.readlines('./input.txt')
puts part1

part2 = Puzzle.new.solve File.readlines('./input.txt'), { 'b' => part1 }
puts part2