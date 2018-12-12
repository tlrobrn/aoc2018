defmodule AdventOfCode.Day10.Part1 do
  def run(input, t \\ 0) do
    input
    |> draw(t)
    |> update
    |> run(t + 1)
  end

  defp update(lights) do
    lights
    |> Enum.map(fn %{px: px, py: py, vx: vx, vy: vy} -> %{px: px + vx, py: py + vy, vx: vx, vy: vy} end)
  end

  defp draw(lights, t) do
    {grid, min_y, max_y, min_x, max_x} =
      lights
      |> Enum.reduce({%{}, nil, nil, nil, nil}, fn %{px: px, py: py}, {map, min_y, max_y, min_x, max_x} ->
        new_max_y = if is_nil(max_y), do: py, else: max(max_y, py)
        new_max_x = if is_nil(max_x), do: px, else: max(max_x, px)
        {
          Map.update(map, py, %{px => "#"}, &Map.put(&1, px, "#")),
          min(min_y, py),
          new_max_y,
          min(min_x, px),
          new_max_x,
        }
      end)

    if max_y - min_y < 20 do
      IO.puts("t = #{t}")
      IO.puts("=======================================================================================")
      min_y..max_y
      |> Stream.map(fn y ->
        Enum.reduce(max_x..min_x, "", fn x, line -> (get_in(grid, [y, x]) || " ") <> line end)
      end)
      |> Enum.each(&IO.puts/1)
      IO.puts("=======================================================================================")
    end

    lights
  end
end
