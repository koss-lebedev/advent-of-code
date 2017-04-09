defmodule AOC2015.Day10 do

  def solve(input, times) when times == 0 do
    length(input)
  end

  def solve(input, times) do
    new_input = look_and_say(input)
    solve(new_input, times - 1)
  end

  defp look_and_say(input, new_input, pointer) when length(input) == 0 do
    new_input
  end

  defp look_and_say(input, new_input \\ [], pointer \\ 0) do
    map = 0..length(input) |> Stream.zip(input) |> Enum.into(%{})
    
#      new_seq = ''
#      pointer = 0
#      while pointer < input.size
#        counter = 1
#        while input[pointer + counter - 1] == input[pointer + counter]
#          counter += 1
#        end
#        new_seq += "#{counter}#{input[pointer]}"
#        pointer += counter
#      end
  end

end

AOC2015.Day10.solve('1113122113', 40)