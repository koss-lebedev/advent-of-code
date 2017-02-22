defmodule AOC2015.Day1 do

  def solve(str) do
    str |> String.graphemes |> Enum.map(&brace_to_int/1) |> Enum.sum
  end

  defp brace_to_int(x) when x == "(" do 1 end
  defp brace_to_int(_) do  -1 end

end

{ :ok, str } = File.read('./input.txt')
IO.puts AdventOfCode.Day1.solve(str)