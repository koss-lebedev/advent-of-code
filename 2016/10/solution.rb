class Puzzle

  def initialize(input, exp_low, exp_high)
    @input = input
    @exp_low = exp_low
    @exp_high = exp_high

    @bots = Hash.new { |h,k| h[k] = [] }
    @output = Hash.new { |h,k| h[k] = [] }
    @commands = []
  end

  def solve
    input.each do |line|
      if line.start_with?('b')
        command = parse_give_command(line)
      else
        command = parse_save_command(line)
      end

      unless execute(command)
        commands << command
      end
    end

    while commands.size > 0
      executed = []
      commands.each_with_index do |command, index|
        executed << index if execute(command)
      end

      commands.reject!.with_index { |_, index| executed.include?(index) }
    end

    puts "Answer #2: #{output[0][0] * output[1][0] * output[2][0]}"
  end

private

  def execute(command)
    case command
      when SaveCommand
        if bots[command.bot].size < 2
          bots[command.bot] << command.value
        else
          false
        end
      when GiveCommand
        if bots[command.bot].size == 2
          low, high = bots[command.bot].sort
          puts "Answer #1: #{command.bot}" if (low == exp_low && high == exp_high)
          if command.discard_low
            bots[command.low_bot] << low
          else
            output[command.low_bot] << low
          end
          if command.discard_high
            bots[command.high_bot] << high
          else
            output[command.high_bot] << high
          end
          bots[command.bot] = []
        else
          false
        end
      else
    end
  end

  attr_reader :input, :exp_low, :exp_high, :bots, :commands, :output

  def parse_give_command(line)
    matches = line.match /bot (?<bot>\d+) gives low to (?<low>\b\w+\b) (?<low_val>\d+) and high to (?<high>\b\w+\b) (?<high_val>\d+)/
    bot = matches[:bot].to_i
    low, high = matches[:low_val].to_i, matches[:high_val].to_i

    GiveCommand.new(bot, low, high, matches[:low] == 'bot', matches[:high] == 'bot')
  end

  def parse_save_command(line)
    matches = line.match /value (?<value>\d+) goes to bot (?<bot>\d+)/
    value, bot = matches[:value].to_i, matches[:bot].to_i

    SaveCommand.new(bot, value)
  end

  class GiveCommand < Struct.new(:bot, :low_bot, :high_bot, :discard_low, :discard_high); end
  class SaveCommand < Struct.new(:bot, :value); end

end

commands = File.readlines('./input.txt')
Puzzle.new(commands, 17, 61).solve