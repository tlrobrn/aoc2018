defmodule AdventOfCode.Day7.Test do
  use ExUnit.Case
  alias AdventOfCode.Day7

  test "part1" do
    assert "ABGKCMVWYDEHFOPQUILSTNZRJX" == Day7.part1()
  end

  test "part2" do
    assert 898 == Day7.part2()
  end
end
