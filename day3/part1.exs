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
    |> reverse_claims
    |> Stream.map(fn {_coordinates, ids} -> length(ids) end)
    |> Enum.count(&(&1 >= 2))
    |> IO.inspect
  end

  defp fabric_claims(claims) do
    claims
    |> Stream.map(fn %Claim{id: id, left: left, top: top, width: width, height: height} ->
      coordinates = left..(left+width-1)
                    |> Enum.flat_map(fn x ->
                      Enum.map(top..(top+height-1), fn y -> {x, y} end)
                    end)
      {id, coordinates}
    end)
  end

  defp reverse_claims(ids_to_coordinates) do
    ids_to_coordinates
    |> Enum.reduce(%{}, fn {id, coordinates}, coordinates_to_ids ->
      Enum.reduce(coordinates, coordinates_to_ids, fn coord, map -> Map.update(map, coord, [id], &([id | &1])) end)
    end)
  end
end

Day3.Part1.run()
