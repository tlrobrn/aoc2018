defmodule AdventOfCode.Day4.Part1 do
  alias AdventOfCode.Day4.Entry

  def run(input) do
    {_, _, minutes} = input |> Enum.reduce({nil, nil, %{}}, &minutes_asleep/2)
    {guard_id, sleep_ranges} = minutes |> Enum.max_by(&count_minutes/1)
    guard_id * most_common_minute(sleep_ranges)
  end

  defp minutes_asleep(%Entry{id: id, timestamp: timestamp, action: :begin}, {prev_id, asleep_since, minutes}) do
    if !is_nil(asleep_since) do
      asleep_range = asleep_since..timestamp.minute
      {id, nil, Map.update(minutes, prev_id, [asleep_range], &[asleep_range | &1])}
    else
      {id, nil, minutes}
    end
  end

  defp minutes_asleep(%Entry{timestamp: timestamp, action: :asleep}, {id, _, minutes}) do
    {id, timestamp.minute, minutes}
  end


  defp minutes_asleep(%Entry{timestamp: timestamp, action: :awake}, {id, asleep_since, minutes}) do
    asleep_range = asleep_since..(timestamp.minute - 1)
    {id, nil, Map.update(minutes, id, [asleep_range], &[asleep_range | &1])}
  end

  defp count_minutes({_id, minutes}) do
    minutes
    |> Stream.map(&Enum.count/1)
    |> Enum.sum
  end

  defp most_common_minute(ranges) do
    {most_common, _count} = ranges
                            |> Enum.reduce(%{}, fn range, counts ->
                              range |> Enum.reduce(counts, fn minute, map -> Map.update(map, minute, 1, &(&1 + 1)) end)
                            end)
                            |> Enum.max_by(fn {_, count} -> count end)

    most_common
  end
end
