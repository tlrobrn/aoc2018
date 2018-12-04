defmodule AdventOfCode.Day2.Part2.Test do
  use ExUnit.Case
  alias AdventOfCode.Day2.Part2

  test "example" do
    input = ~w[
      abcde
      fghij
      klmno
      pqrst
      fguij
      axcye
      wvxyz
    ] |> Stream.map(&String.graphemes/1)

    assert "fgij" == Part2.run(input)
  end
end
