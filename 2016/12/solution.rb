def execute(commands, initial_state = {})

  regs = Hash.new(0).merge(initial_state)
  cursor = 0

  while cursor < commands.size
    cmd, *args = commands[cursor].split(' ')
    case cmd
      when 'cpy'
        regs[args[1]] = Integer(args[0]) rescue regs[args[0]]
        cursor += 1
      when 'inc'
        regs[args[0]] += 1
        cursor += 1
      when 'dec'
        regs[args[0]] -= 1
        cursor += 1
      when 'jnz'
        val = Integer(args[0]) rescue regs[args[0]]
        if val > 0
          cursor += Integer(args[1])
        else
          cursor += 1
        end
    end
  end

  regs['a']
end

commands = File.readlines('./input.txt')
puts execute(commands)
puts execute(commands, { 'c' => 1 })