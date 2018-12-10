defmodule AdventOfCode.Day5.Part1.Test do
  use ExUnit.Case
  alias AdventOfCode.Day5.Part1

  test "example 1" do
    assert 0 == String.graphemes("Aa") |> Part1.run()
  end

  test "example 2" do
    assert 0 == String.graphemes("abBA") |> Part1.run()
  end

  test "example 3" do
    assert 4 == String.graphemes("abAB") |> Part1.run()
  end

  test "example 4" do
    assert 6 == String.graphemes("aabAAB") |> Part1.run()
  end

  test "example 5" do
    assert 10 == String.graphemes("dabAcCaCBAcCcaDA") |> Part1.run()
  end
end
