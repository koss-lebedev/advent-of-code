defmodule AdventOfCode.Day1 do

  def solve(str) do
    str |> String.graphemes |> Enum.map(&brace_to_int/1) |> Enum.sum
  end

  defp brace_to_int(x) do
    if (x == "("), do: 1, else: -1
  end

end

{ :ok, str } = File.read('./input.txt')
IO.puts AdventOfCode.Day1.solve(str)