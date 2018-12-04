defmodule AdventOfCode.Day4.Part1 do
  alias AdventOfCode.Day4

  def run(input) do
    {_, _, minutes} = input |> Enum.reduce({nil, nil, %{}}, &Day4.minutes_asleep/2)
    {guard_id, sleep_ranges} = minutes |> Enum.max_by(&count_minutes/1)
    guard_id * most_common_minute(sleep_ranges)
  end

  defp count_minutes({_id, minutes}) do
    minutes
    |> Stream.map(&Enum.count/1)
    |> Enum.sum()
  end

  defp most_common_minute(ranges) do
    {most_common, _count} =
      ranges
      |> Enum.reduce(%{}, fn range, counts ->
        range |> Enum.reduce(counts, fn minute, map -> Map.update(map, minute, 1, &(&1 + 1)) end)
      end)
      |> Enum.max_by(fn {_, count} -> count end)

    most_common
  end
end
