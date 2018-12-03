defmodule Day3.Part1 do
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
    @input
    |> File.stream!
    |> Stream.map(&String.trim/1)
    |> Enum.map(&Claim.from_string/1)
    |> fabric_claims
    |> Stream.map(fn {_coordinates, ids} -> length(ids) end)
    |> Enum.count(&(&1 >= 2))
    |> IO.inspect
  end

  defp fabric_claims(claims) do
    0..999
    |> Stream.flat_map(&Enum.map(0..999, fn y -> {&1, y} end))
    |> Stream.map(&apply_claims(&1, claims))
  end

  defp apply_claims({x, y}, claims) do
    assigned_ids = claims
                   |> Stream.map(fn
                     %Claim{id: id, left: left, top: top, width: width, height: height} when x >= left and y >= top and x < left + width and y < top + height -> id
                     _ -> nil
                   end)
                   |> Enum.reject(&is_nil/1)

    {{x, y}, assigned_ids}
  end
end

Day3.Part1.run()
