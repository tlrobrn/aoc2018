defmodule AdventOfCode.Day2.Part1.Test do
  use ExUnit.Case
  alias AdventOfCode.Day2.Part1

  test "example" do
    input = ~w[
      abcdef
      bababc
      abbcde
      abcccd
      aabcdd
      abcdee
      ababab
    ] |> Stream.map(&String.graphemes/1)

    assert 12 == Part1.run(input)
  end
end
