defmodule AdventOfCode.Day6.Part2 do
  alias AdventOfCode.Day6

  def run(input, cutoff \\ 10_000) do
    input
    |> get_total_distances(input, cutoff)
    |> Enum.count(fn {_, d} -> d < cutoff end)
  end

  defp get_total_distances(points_remaining, points, cutoff, result \\ %{})
  defp get_total_distances([], _, _, result), do: result
  defp get_total_distances([{x, y} = p | tail], points, cutoff, result) do
    if Map.has_key?(result, p) do
      get_total_distances(tail, points, cutoff, result)
    else
      td = Day6.total_distance(p, points, 0)
      if td < cutoff do
        result = Map.put(result, p, td)
        neighbors =
          [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
          |> Enum.reject(&Map.has_key?(result, &1))
        get_total_distances(neighbors ++ tail, points, cutoff, result)
      else
        get_total_distances(tail, points, cutoff, result)
      end
    end
  end
end
