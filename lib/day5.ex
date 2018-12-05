defmodule AdventOfCode.Day5 do
  defp parse(lines) do
    lines |> Enum.flat_map(&String.graphemes/1)
  end

  use AdventOfCode.Day
end
