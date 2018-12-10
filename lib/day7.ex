defmodule AdventOfCode.Day7 do
  def parse(lines) do
    lines
    |> Enum.map(&{String.at(&1, 5), String.at(&1, 36)})
    |> Enum.reduce(%{}, &build_graph/2)
  end

  def starting_queue(graph) do
    graph
    |> Enum.reduce(MapSet.new(), fn
      {node, %{parents: []}}, queue -> MapSet.put(queue, node)
      _, queue -> queue
    end)
  end

  defp build_graph({parent, child}, graph) do
    graph
    |> Map.update(parent, %{parents: [], children: [child]}, fn %{parents: ps, children: cs} ->
      %{parents: ps, children: [child | cs]}
    end)
    |> Map.update(child, %{parents: [parent], children: []}, fn %{parents: ps, children: cs} ->
      %{parents: [parent | ps], children: cs}
    end)
  end

  use AdventOfCode.Day
end
