defmodule AdventOfCode.Day9 do
  @pattern ~r{(?<players>\d+) players; last marble is worth (?<marbles>\d+) points}
  defp parse(lines) do
    line = Enum.at(lines, 0)
    %{"players" => players, "marbles" => marbles} =
      Regex.named_captures(@pattern, line)
    {String.to_integer(players), String.to_integer(marbles)}
  end

  use AdventOfCode.Day
end
