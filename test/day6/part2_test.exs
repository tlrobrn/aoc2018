defmodule AdventOfCode.Day6.Part2.Test do
  use ExUnit.Case
  alias AdventOfCode.Day6.Part2

  test "example" do
    input = [
      {1, 1},
      {1, 6},
      {8, 3},
      {3, 4},
      {5, 5},
      {8, 9}
    ]

    assert 16 == Part2.run(input, 32)
  end
end
