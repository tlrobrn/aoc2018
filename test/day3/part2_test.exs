defmodule AdventOfCode.Day3.Part2.Test do
  use ExUnit.Case
  alias AdventOfCode.Day3.Part2

  test "example" do
    input =
      [
        "#1 @ 1,3: 4x4",
        "#2 @ 3,1: 4x4",
        "#3 @ 5,5: 2x2"
      ]
      |> AdventOfCode.Day3.parse()

    assert 3 == Part2.run(input)
  end
end
