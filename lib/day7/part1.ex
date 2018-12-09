defmodule AdventOfCode.Day7.Part1 do
  def run(input) do
    input
    |> Enum.to_list
    |> Enum.reduce(%{}, &build_graph/2)
    |> resolve
  end

  defp build_graph({parent, child}, graph) do
    graph
    |> Map.update(parent, %{parents: [], children: [child]}, fn %{parents: ps, children: cs} -> %{parents: ps, children: [child | cs]} end)
    |> Map.update(child, %{parents: [parent], children: []}, fn %{parents: ps, children: cs} -> %{parents: [parent | ps], children: cs} end)
  end

  defp resolve(graph) do
      graph
      |> Enum.reduce(MapSet.new(), fn
        {node, %{parents: []}}, candidates -> MapSet.put(candidates, node)
        _, candidates -> candidates
      end)
      |> Enum.sort
      |> resolve(graph, "")
  end

  defp resolve([], _, complete), do: String.reverse(complete)
  defp resolve([x | tail], graph, complete) do
    if Enum.all?(graph[x].parents, &String.contains?(complete, &1)) do
      graph[x].children ++ tail
      |> MapSet.new
      |> Enum.sort
      |> resolve(graph, x <> complete)
    else
      resolve(tail, graph, complete)
    end
  end
end
