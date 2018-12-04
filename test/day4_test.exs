defmodule AdventOfCode.Day4.Test do
  use ExUnit.Case
  alias AdventOfCode.Day4

  test "parse" do
    input = [
      "[1518-11-01 00:05] falls asleep",
      "[1518-11-01 00:25] wakes up",
      "[1518-11-01 00:00] Guard #10 begins shift",
    ]

    expected = [
      %Day4.Entry{id: 10, timestamp: ~N[1518-11-01 00:00:00], action: :begin},
      %Day4.Entry{id: nil, timestamp: ~N[1518-11-01 00:05:00], action: :asleep},
      %Day4.Entry{id: nil, timestamp: ~N[1518-11-01 00:25:00], action: :awake},
    ]

    assert expected == Day4.parse(input) |> Enum.to_list
  end
end
