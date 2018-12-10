defmodule AdventOfCode.Day8.Part2.Test do
  use ExUnit.Case
  alias AdventOfCode.Day8.Part2

  test "example" do
    input = ["2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"] |> AdventOfCode.Day8.parse()
    assert 66 == Part2.run(input)
  end
end
