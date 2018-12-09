defmodule AdventOfCode.Day6 do
  defp parse(lines) do
    lines
    |> Stream.map(&String.split(&1, ", "))
    |> Enum.map(fn [x, y] -> {String.to_integer(x), String.to_integer(y)} end)
  end

  def total_distance(_p, [], d), do: d
  def total_distance(p, [q | tail], d) do
    total_distance(p, tail, d + manhatten_distance(p, q))
  end

  def manhatten_distance({x1, y1}, {x2, y2}) do
    abs(x1 - x2) + abs(y1 - y2)
  end

  use AdventOfCode.Day
end
