defmodule AdventOfCode.Day2.Part1 do
  def run(input) do
    {twos, threes} =
      input
      |> Stream.map(&two_or_three/1)
      |> Enum.reduce({0, 0}, fn
        {true, true}, {twos, threes} -> {twos + 1, threes + 1}
        {true, false}, {twos, threes} -> {twos + 1, threes}
        {false, true}, {twos, threes} -> {twos, threes + 1}
        _, twos_and_threes -> twos_and_threes
      end)

    twos * threes
  end

  defp two_or_three(letters) do
    counts =
      letters
      |> Enum.reduce(%{}, fn c, map -> Map.update(map, c, 1, &(&1 + 1)) end)

    {Enum.any?(counts, fn {_, n} -> n == 2 end), Enum.any?(counts, fn {_, n} -> n == 3 end)}
  end
end
