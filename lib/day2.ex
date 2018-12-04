defmodule AdventOfCode.Day2 do
  defp parse(lines) do
    lines |> Stream.map(&String.graphemes/1)
  end

  use AdventOfCode.Day
end
