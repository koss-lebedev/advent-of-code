defmodule AOC2015.Day02 do

  def solve(arr, index \\ 0, total \\ 0) do
    if index < Enum.count(arr) do
      dims = Enum.at(arr, index) |> String.split("x") |> Enum.map(&String.strip/1)
                                      |> Enum.map(&String.to_integer/1) |> Enum.sort
      [a, b, c] = dims
      delta = 2*a + 2*b + Enum.reduce(dims, &*/2)
      solve(arr, index + 1, total + delta)
    else
      total
    end
  end

end

File.stream!('./input.txt') |> AOC2015.Day02.solve |> IO.puts
