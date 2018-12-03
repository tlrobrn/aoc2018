defmodule Day3.Part2 do
  defmodule Claim do
    @pattern ~r{#(?<id>\d+) @ (?<left>\d+),(?<top>\d+): (?<width>\d+)x(?<height>\d+)}

    defstruct [:id, :left, :top, :width, :height]

    def from_string(s) do
      fields = Regex.named_captures(@pattern, s)
               |> Enum.map(fn {key, value} ->
                 {String.to_atom(key), String.to_integer(value)}
               end)

      struct(__MODULE__, fields)
    end
  end

  @input "./input.txt"

  def run do
    claims = @input
    |> File.stream!
    |> Stream.map(&String.trim/1)
    |> Enum.map(&Claim.from_string/1)

    claims
    |> Enum.find(&no_overlap(&1, claims))
    |> IO.inspect
  end

  defp no_overlap(%Claim{id: id, left: left, top: top, width: width, height: height}, claims) do
    claims
    |> Stream.reject(&(&1.id == id))
    |> Enum.all?(fn %Claim{left: other_left, top: other_top, width: other_width, height: other_height} ->
      !(left < other_left + other_width
      && left + width > other_left
      && top < other_top + other_height
      && top + height > other_top)
    end)
  end
end

Day3.Part2.run()
