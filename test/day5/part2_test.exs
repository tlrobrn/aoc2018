defmodule AdventOfCode.Day5.Part2.Test do
  use ExUnit.Case
  alias AdventOfCode.Day5.Part2

  test "example" do
    assert 4 == String.graphemes("dabAcCaCBAcCcaDA") |> Part2.run()
  end
end
