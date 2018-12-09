defmodule AdventOfCode.Day7 do
  def parse(lines) do
    lines
    |> Stream.map(&{String.at(&1, 5), String.at(&1, 36)})
  end

  use AdventOfCode.Day
end
