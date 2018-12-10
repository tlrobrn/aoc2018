defmodule AdventOfCode.Day7.Part1 do
  alias AdventOfCode.Day7

  def run(input) do
    input |> resolve
  end

  defp resolve(graph) do
    graph
    |> Day7.starting_queue()
    |> Enum.sort()
    |> resolve(graph, "")
  end

  defp resolve([], _, complete), do: String.reverse(complete)

  defp resolve([x | tail], graph, complete) do
    if Enum.all?(graph[x].parents, &String.contains?(complete, &1)) do
      (graph[x].children ++ tail)
      |> MapSet.new()
      |> Enum.sort()
      |> resolve(graph, x <> complete)
    else
      resolve(tail, graph, complete)
    end
  end
end
