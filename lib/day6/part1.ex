defmodule AdventOfCode.Day6.Part1 do
  alias AdventOfCode.Day6
  def run(input) do
    input
    |> Enum.map(&{&1, distances(&1, input)})
    |> label_points(input, %{}, MapSet.new())
    |> Stream.map(fn {_, count} -> count end)
    |> Enum.max
  end

  defp label_points([], _points, labels, infinites) do
    labels
    |> Stream.reject(fn {_, label} -> MapSet.member?(infinites, label) end)
    |> Enum.reduce(%{}, fn {_, label}, acc -> Map.update(acc, label, 1, &(&1 + 1)) end) 
  end
  defp label_points([{{x, y} = p, dists} | tail], points, labels, infinites) do
    if Map.has_key?(labels, p) do
      label_points(tail, points, labels, infinites)
    else
      {owner, _} = dists |> Enum.min_by(fn {_, d} -> d end)
      labels = Map.put(labels, p, owner)

      neighbors =
        [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
        |> Enum.reject(&Map.has_key?(labels, &1))
        |> Enum.map(&{&1, distances(&1, points)})

      new_infinites =
        neighbors
        |> Stream.filter(fn {_, ds} ->
          ds |> Enum.all?(fn {q, d} -> d >= dists[q] end)
        end)
        |> Enum.map(fn {_, ds} -> 
          {owner, _} = ds |> Enum.min_by(fn {_, d} -> d end)
          owner
        end)

      if !Enum.empty?(new_infinites) do
        label_points(tail, points, labels, Enum.reduce(new_infinites, infinites, &MapSet.put(&2, &1)))
      else
        label_points(neighbors ++ tail, points, labels, infinites)
      end
    end
  end

  defp distances(p, points) do
    points
    |> Enum.reduce(%{}, &Map.put(&2, &1, Day6.manhatten_distance(&1, p)))
  end
end
