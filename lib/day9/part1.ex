defmodule AdventOfCode.Day9.Part1 do
  def run({players, marbles}) do
    1..players
    |> Enum.to_list
    |> Stream.cycle()
    |> Enum.zip(1..marbles)
    |> play([0], 0, %{})
    |> Map.values()
    |> Enum.max
  end

  defp play([], _marbles, _current, points), do: points

  defp play([{player, marble} | turns], marbles, current, points)
  when rem(marble, 23) == 0 do
    new_current = step(marbles, current, -7)
    {popped, new_marbles} = List.pop_at(marbles, new_current)
    new_points = Map.update(points, player, marble + popped, &(&1 + marble + popped))
    play(turns, new_marbles, new_current, new_points)
  end

  defp play([{_player, marble} | turns], marbles, current, points) do
    new_current = step(marbles, current, 2)
    new_marbles = List.insert_at(marbles, new_current, marble)
    play(turns, new_marbles, new_current, points)
  end

  defp step(list, current, steps) do
    case length(list) do
      count when rem(count, 2) == 0 -> rem(current + steps, count)
      count -> rem(current + steps, count + 1)
    end
  end
end
