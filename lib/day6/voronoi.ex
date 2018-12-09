defmodule AdventOfCode.Day6.Voronoi do


  defp distance({x1, y1}, {x2, y2}) do
    abs(x1 - x2) + abs(y1 - y2)
  end
end
