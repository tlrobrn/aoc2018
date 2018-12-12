defmodule AdventOfCode.Day9.Part1 do
  def run({players, marbles}) do
    1..players
    |> Enum.to_list()
    |> Stream.cycle()
    |> Enum.zip(1..marbles)
    |> play(%{0 => {0, 0}}, 0, %{})
    |> Map.values()
    |> Enum.max()
  end

  defp play([], _marbles, _current, points), do: points

  defp play([{player, marble} | turns], marbles, current, points)
       when rem(marble, 23) == 0 do
    popped = move(marbles, marbles[current], -7)
    new_marbles = pop(marbles, popped)
    {_, new_current} = marbles[popped]
    new_points = Map.update(points, player, marble + popped, &(&1 + marble + popped))
    play(turns, new_marbles, new_current, new_points)
  end

  defp play([{_player, marble} | turns], marbles, current, points) do
    index = move(marbles, marbles[current], 2)
    new_marbles = insert(marbles, index, marble)
    play(turns, new_marbles, marble, points)
  end

  defp move(marbles, {_cc, clockwise}, 0), do: elem(marbles[clockwise], 0)
  defp move(marbles, {_cc, clockwise}, n) when n > 0, do: move(marbles, marbles[clockwise], n - 1)

  defp move(marbles, {counter_clockwise, _c}, n),
    do: move(marbles, marbles[counter_clockwise], n + 1)

  defp pop(marbles, marble) do
    {counter_clockwise, clockwise} = marbles[marble]

    marbles
    |> Map.delete(marble)
    |> Map.update(counter_clockwise, nil, fn {cc, _} -> {cc, clockwise} end)
    |> Map.update(clockwise, nil, fn {_, c} -> {counter_clockwise, c} end)
  end

  defp insert(marbles, index, marble) do
    {cc, _} = marbles[index]

    marbles
    |> Map.update(cc, nil, fn {counter, _} -> {counter, marble} end)
    |> Map.update(index, nil, fn {_, clockwise} -> {marble, clockwise} end)
    |> Map.put(marble, {cc, index})
  end
end
