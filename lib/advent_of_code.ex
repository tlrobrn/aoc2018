defmodule AdventOfCode do
  @moduledoc """
  Documentation for AdventOfCode.
  """

  @doc """
  Stream input file
  """
  def input_lines(day) do
    "input/day#{day}.txt"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
