defmodule AdventOfCode.Day5.Part2 do
  alias AdventOfCode.Day5.Part1

  def run(input) do
    input
    |> Enum.reduce(MapSet.new(), &MapSet.put(&2, String.downcase(&1)))
    |> Stream.map(&MapSet.new([&1, String.upcase(&1)]))
    |> Enum.reduce(nil, fn units, minimum ->
      input
      |> Enum.reject(&MapSet.member?(units, &1))
      |> Part1.run
      |> min(minimum)
    end)
  end
end
