defmodule AdventOfCode.Day9.Part2 do
  alias AdventOfCode.Day9.Part1

  def run({players, marbles}) do
    Part1.run({players, marbles * 100})
  end
end
