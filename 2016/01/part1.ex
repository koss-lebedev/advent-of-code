defmodule AOC2016.Day1 do

  def solve(input) do
    dir_map = %{n: [:w, :e], e: [:n, :s], s: [:e, :w], w: [:s, :n]}
    input |> String.split(", ") |> track_dir(dir_map)
  end

  defp track_dir(arr, dir_map, index \\ 0, x \\ 0, y \\ 0, dir \\ :n) do
    if index < Enum.count(arr) do
        [_, turn, delta] = Regex.run(~r/(\w{1})(.*)/, Enum.at(arr, index) )
        delta = String.to_integer(delta)
        new_dir = dir_map[dir] |> Enum.at(turn_to_int(turn))
        {delta_x, delta_y} = case new_dir do
          :n -> {0, delta}
          :s -> {0, -delta}
          :e -> {delta, 0}
          :w -> {-delta, 0}
        end

        track_dir(arr, dir_map, index + 1, x + delta_x, y + delta_y, new_dir)
    else
        abs(x) + abs(y)
    end
  end

  defp turn_to_int(turn) when turn == "L" do 0 end
  defp turn_to_int(_) do 1 end

end

{ :ok, input } = File.read('./input.txt')
IO.puts AOC2016.Day1.solve(input)