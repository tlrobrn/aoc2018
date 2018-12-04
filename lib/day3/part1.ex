defmodule AdventOfCode.Day3.Part1 do
  alias AdventOfCode.Day3.Claim

  def run(input) do
    input
    |> fabric_claims
    |> reverse_claims
    |> Stream.map(fn {_coordinates, claim_count} -> claim_count end)
    |> Enum.count(&(&1 >= 2))
  end

  defp fabric_claims(claims) do
    claims
    |> Stream.map(fn %Claim{id: id, left: left, top: top, width: width, height: height} ->
      coordinates =
        left..(left + width - 1)
        |> Enum.flat_map(fn x ->
          Enum.map(top..(top + height - 1), fn y -> {x, y} end)
        end)

      {id, coordinates}
    end)
  end

  defp reverse_claims(ids_to_coordinates) do
    ids_to_coordinates
    |> Enum.reduce(%{}, fn {_id, coordinates}, claim_counts ->
      Enum.reduce(coordinates, claim_counts, fn coord, map ->
        Map.update(map, coord, 1, &(&1 + 1))
      end)
    end)
  end
end
