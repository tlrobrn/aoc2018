defmodule AdventOfCode.Day10 do
  @pattern ~r{position=\<(?<px>[^,]+),\s+(?<py>[^\>]+)\>\s+velocity=\<(?<vx>[^,]+),\s+(?<vy>[^\>]+)\>}
  defp parse(lines) do
    lines
    |> Enum.map(fn line ->
      Regex.named_captures(@pattern, line)
      |> Map.new(fn {key, value} -> {String.to_atom(key), String.to_integer(String.trim(value))} end)
    end)
  end

  use AdventOfCode.Day
end
