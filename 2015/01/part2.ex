defmodule AdventOfCode.Day1 do

  def solve(str) do
    str |> String.graphemes |> Enum.map(&brace_to_int/1) |> find_basement(0, 0)
  end

  defp find_basement(arr, counter, index) do
    if counter < 0 || index == Enum.count(arr) - 1 do
      index
    else
      find_basement(arr, counter + Enum.at(arr,index), index + 1)
    end
  end

  defp brace_to_int(x) when x == "(" do 1 end
  defp brace_to_int(_) do  -1 end

end

{ :ok, str } = File.read('./input.txt')
IO.puts AdventOfCode.Day1.solve(str)