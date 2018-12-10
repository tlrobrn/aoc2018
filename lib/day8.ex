defmodule AdventOfCode.Day8 do
  def parse(lines) do
    lines
    |> Stream.flat_map(&String.split(&1, " "))
    |> Enum.map(&String.to_integer/1)
  end

  use AdventOfCode.Day
end
