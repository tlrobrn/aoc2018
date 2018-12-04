defmodule AdventOfCode.Day3 do
  defmodule Claim do
    @pattern ~r{#(?<id>\d+) @ (?<left>\d+),(?<top>\d+): (?<width>\d+)x(?<height>\d+)}

    defstruct [:id, :left, :top, :width, :height]

    def from_string(s) do
      fields =
        Regex.named_captures(@pattern, s)
        |> Enum.map(fn {key, value} ->
          {String.to_atom(key), String.to_integer(value)}
        end)

      struct(__MODULE__, fields)
    end
  end

  def parse(lines) do
    lines |> Stream.map(&Claim.from_string/1)
  end

  use AdventOfCode.Day
end
