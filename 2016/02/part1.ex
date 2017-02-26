defmodule AOC2016.Day2 do

  @keypad [ [1,2,3], [4,5,6], [7,8,9] ]

  def solve(input) do
    { _, _, code } = input |> Enum.reduce({ 1, 1, [] }, &process_line/2)
    Enum.join(code)
  end

  defp process_line(line, { x, y, code }) do
    { new_x, new_y } = line |> String.trim |> String.graphemes |> Enum.reduce({ x, y }, &process_command/2)
    { new_x, new_y, code ++ [(Enum.at(@keypad, new_x) |> Enum.at(new_y))] }
  end

  defp process_command(command, { x, y }) do
    { delta_x, delta_y } = case command do
      "U" -> { (if x > 0 do -1 else 0 end), 0 }
      "D" -> { (if x < 2 do 1 else 0 end), 0 }
      "L" -> { 0, (if y > 0 do -1 else 0 end) }
      "R" -> { 0, (if y < 2 do 1 else 0 end) }
    end

    { x + delta_x, y + delta_y }
  end

end

File.stream!("./input.txt") |> AOC2016.Day2.solve |> IO.inspect