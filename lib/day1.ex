defmodule AdventOfCode.Day1 do
  defp parse(lines) do
    lines |> Stream.map(&String.to_integer/1)
  end

  use AdventOfCode.Day
end
