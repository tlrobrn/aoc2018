defmodule AdventOfCode.Day5.Part1 do
  def run(input, had_reaction \\ false, result \\ [])
  def run([], false, result), do: Enum.count(result)
  def run([], true, result), do: run(result)
  def run([a], had_reaction, result), do: run([], had_reaction, [a | result])

  def run([a, b | tail], had_reaction, result) do
    if a != b and String.upcase(a) == String.upcase(b) do
      run(tail, true, result)
    else
      run([b | tail], had_reaction, [a | result])
    end
  end
end
