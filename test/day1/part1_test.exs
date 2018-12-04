defmodule AdventOfCode.Day1.Part1.Test do
  use ExUnit.Case
  alias AdventOfCode.Day1.Part1

  test "run example 1" do
    input = [1, -2, 3, 1]
    assert 3 == Part1.run(input)
  end

  test "run example 2" do
    input = [1, 1, 1]
    assert 3 == Part1.run(input)
  end

  test "run example 3" do
    input = [1, 1, -2]
    assert 0 == Part1.run(input)
  end

  test "run example 4" do
    input = [-1, -2, -3]
    assert -6 == Part1.run(input)
  end
end
