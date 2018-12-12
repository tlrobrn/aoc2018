defmodule AdventOfCode.Day9.Part1.Test do
  use ExUnit.Case
  alias AdventOfCode.Day9.Part1

  test "example 1" do
    assert 32 == Part1.run({9, 25})
  end

  test "example 2" do
    assert 8317 == Part1.run({10, 1618})
  end

  test "example 3" do
    assert 146_373 == Part1.run({13, 7999})
  end

  test "example 4" do
    assert 2764 == Part1.run({17, 1104})
  end

  test "example 5" do
    assert 54718 == Part1.run({21, 6111})
  end

  test "example 6" do
    assert 37305 == Part1.run({30, 5807})
  end
end
