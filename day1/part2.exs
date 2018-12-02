defmodule Day1.Part2 do
  @input "./input.txt"

  def run do
    @input
    |> File.stream!
    |> Stream.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> Stream.cycle
    |> Stream.transform({MapSet.new([0]), 0}, &track_frequency/2)
    |> Enum.find(&seen_twice/1)
    |> IO.inspect
  end

  defp track_frequency(delta, {seen, current_frequency}) do
    next_frequency = current_frequency + delta
    {[{next_frequency, next_frequency in seen}], {MapSet.put(seen, next_frequency), next_frequency}}
  end

  defp seen_twice({_, duplicate}), do: duplicate
end

Day1.Part2.run
