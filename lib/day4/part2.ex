defmodule AdventOfCode.Day4.Part2 do
  alias AdventOfCode.Day4

  def run(input) do
    {_, _, minutes} = input |> Enum.reduce({nil, nil, %{}}, &Day4.minutes_asleep/2)

    {guard_id, minute_counts} =
      minutes
      |> get_minute_counts
      |> Enum.max_by(fn {_id, counts} -> counts |> Map.values() |> Enum.max() end)

    {max_minute, _} =
      minute_counts
      |> Enum.max_by(fn {_, count} -> count end)

    guard_id * max_minute
  end

  # %{id => %{minute => count}}
  defp get_minute_counts(minutes) do
    minutes
    |> Enum.reduce(%{}, fn {id, ranges}, acc ->
      minute_counts =
        ranges
        |> Enum.reduce(%{}, fn range, counts ->
          Enum.reduce(range, counts, fn minute, map ->
            Map.update(map, minute, 1, &(&1 + 1))
          end)
        end)

      Map.put(acc, id, minute_counts)
    end)
  end
end
