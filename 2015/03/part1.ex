defmodule AOC2015.Day03 do

  def solve(input) do
    { _, _, moves} = input |> String.graphemes |> Enum.reduce({ 0, 0, %{ } }, &track_move/2)
    moves |> Enum.reduce(0, fn({key, value}, acc) -> acc + MapSet.size(value) end)
  end

  defp track_move(dir, {x,y,map}) do
    {delta_x, delta_y} = case dir do
      "<" -> {-1, 0}
      ">" -> {1, 0}
      "^" -> {0, 1}
      "v" -> {0, -1}
    end
    { x + delta_x, y + delta_y, Map.put(map, x, MapSet.put(map[x] || MapSet.new, y)) }
  end

end

File.read!("./input.txt") |> AOC2015.Day03.solve |> IO.inspect