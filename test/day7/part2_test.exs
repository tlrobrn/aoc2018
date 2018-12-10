defmodule AdventOfCode.Day7.Part2.Test do
  use ExUnit.Case
  alias AdventOfCode.Day7.Part2

  test "example" do
    input = [
      "Step C must be finished before step A can begin.",
      "Step C must be finished before step F can begin.",
      "Step A must be finished before step B can begin.",
      "Step A must be finished before step D can begin.",
      "Step B must be finished before step E can begin.",
      "Step D must be finished before step E can begin.",
      "Step F must be finished before step E can begin.",
    ]
    |> AdventOfCode.Day7.parse

    assert 15 == input |> Part2.run(2, 0)
  end
end
