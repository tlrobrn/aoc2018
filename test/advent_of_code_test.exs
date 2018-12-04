defmodule AdventOfCodeTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "input_lines streams lines of an input file" do
    result = AdventOfCode.input_lines("test") |> Enum.to_list()

    assert ["test", "content"] == result
  end
end
