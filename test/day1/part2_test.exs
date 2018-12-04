defmodule AdventOfCode.Day1.Part2.Test do
  use ExUnit.Case
  alias AdventOfCode.Day1.Part2

  test "run example 1" do
    input = [1, -2, 3, 1]
    assert 2 == Part2.run(input)
  end

  test "run example 2" do
    input = [1, -1]
    assert 0 == Part2.run(input)
  end

  test "run example 3" do
    input = [+3, +3, +4, -2, -4]
    assert 10 == Part2.run(input)
  end

  test "run example 4" do
    input = [-6, +3, +8, +5, -6]
    assert 5 == Part2.run(input)
  end

  test "run example 5" do
    input = [+7, +7, -2, -7, -4]
    assert 14 == Part2.run(input)
  end
end
