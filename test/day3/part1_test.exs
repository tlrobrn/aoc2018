defmodule AdventOfCode.Day3.Part1.Test do
  use ExUnit.Case
  alias AdventOfCode.Day3.Part1

  test "example" do
    input =
      [
        "#1 @ 1,3: 4x4",
        "#2 @ 3,1: 4x4",
        "#3 @ 5,5: 2x2"
      ]
      |> AdventOfCode.Day3.parse()

    assert 4 == Part1.run(input)
  end
end
