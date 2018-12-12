defmodule AdventOfCode.Day9.Test do
  use ExUnit.Case
  alias AdventOfCode.Day9

  test "part 1" do
    assert 436_720 == Day9.part1()
  end

  test "part 2" do
    assert 3_527_845_091 == Day9.part2()
  end
end
