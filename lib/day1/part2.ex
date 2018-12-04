defmodule AdventOfCode.Day1.Part2 do
  def run(input) do
    {frequency, _} =
      input
      |> Enum.to_list()
      |> Stream.cycle()
      |> Stream.transform({MapSet.new([0]), 0}, &track_frequency/2)
      |> Enum.find(&seen_twice/1)

    frequency
  end

  defp track_frequency(delta, {seen, current_frequency}) do
    next_frequency = current_frequency + delta

    {[{next_frequency, next_frequency in seen}],
     {MapSet.put(seen, next_frequency), next_frequency}}
  end

  defp seen_twice({_, duplicate}), do: duplicate
end
