defmodule AOC2015.Day02 do

  def solve(arr, index \\ 0, total \\ 0) do
    if index < Enum.count(arr) do
      [a, b, c] = Enum.at(arr, index) |> String.split("x") |> Enum.map(&String.strip/1)
                                      |> Enum.map(&String.to_integer/1) |> Enum.sort
      delta = 2*a*b + 2*b*c + 2*c*a + a*b
      solve(arr, index + 1, total + delta)
    else
      total
    end
  end

end

File.stream!('./input.txt') |> AOC2015.Day02.solve |> IO.puts
