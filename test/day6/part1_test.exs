defmodule AdventOfCode.Day6.Part1.Test do
  use ExUnit.Case
  alias AdventOfCode.Day6.Part1

  test "example" do
    input = [
      {1, 1},
      {1, 6},
      {8, 3},
      {3, 4},
      {5, 5},
      {8, 9}
    ]

    assert 17 == Part1.run(input)
  end
end
