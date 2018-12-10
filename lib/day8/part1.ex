defmodule AdventOfCode.Day8.Part1 do
  def run(input, stack \\ [], total \\ 0)
  def run([], [], total), do: total
  def run([a, b | tail], [], total), do: run(tail, [{a, b}], total)
  def run(input, [{0, 0} | stack], total), do: run(input, stack, total)
  def run([m | tail], [{0, n} | stack], total), do: run(tail, [{0, n - 1} | stack], total + m)

  def run([a, b | tail], [{n, m} | stack], total),
    do: run(tail, [{a, b}, {n - 1, m} | stack], total)
end
