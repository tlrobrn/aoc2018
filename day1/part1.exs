defmodule Day1.Part1 do
  @input "./input.txt"

  def run do
    @input
    |> File.stream!
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum
    |> IO.puts
  end
end

Day1.Part1.run
