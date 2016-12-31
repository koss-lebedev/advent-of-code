def execute(commands, initial_state = {})
  wires = Hash.new.merge(initial_state)

  until commands.empty?
    command = commands.shift
    case command
      when /LSHIFT/
        matches = command.match(/(?<a>\w+) LSHIFT (?<b>\w+) -> (?<reg>\w+)/)
        a = (Integer(matches[:a]) rescue wires[matches[:a]])
        if a
          wires[matches[:reg]] = a << Integer(matches[:b])
        else
          commands.push command
        end
      when /RSHIFT/
        matches = command.match(/(?<a>\w+) RSHIFT (?<b>\w+) -> (?<reg>\w+)/)
        a = (Integer(matches[:a]) rescue wires[matches[:a]])
        if a
          wires[matches[:reg]] = a >> Integer(matches[:b])
        else
          commands.push command
        end
      when /AND/
        matches = command.match(/(?<a>\w+) AND (?<b>\w+) -> (?<reg>\w+)/)
        a = (Integer(matches[:a]) rescue wires[matches[:a]])
        b = (Integer(matches[:b]) rescue wires[matches[:b]])
        if a && b
          wires[matches[:reg]] = a & b
        else
          commands.push command
        end
      when /OR/
        matches = command.match(/(?<a>\w+) OR (?<b>\w+) -> (?<reg>\w+)/)
        a, b = (Integer(matches[:a]) rescue wires[matches[:a]]), (Integer(matches[:b]) rescue wires[matches[:b]])
        if a && b
          wires[matches[:reg]] = a | b
        else
          commands.push command
        end
      when /NOT/
        matches = command.match(/NOT (?<a>\w+) -> (?<reg>\w+)/)
        a = (Integer(matches[:a]) rescue wires[matches[:a]])
        if a
          wires[matches[:reg]] = a ^ 0xffff
        else
          commands.push command
        end
      else
        matches = command.match(/(?<arg>\w+) -> (?<reg>\w+)/)
        a = Integer(matches[:arg]) rescue wires[matches[:arg]]
        if a
          wires[matches[:reg]] = a
        else
          commands.push command
        end
    end
  end


  wires['a']
end

part1 = execute File.readlines('./input.txt')
puts part1

part2 = execute File.readlines('./input.txt'), { 'b' => part1 }
puts part2