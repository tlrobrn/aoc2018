defmodule AdventOfCode.Day3.Part2 do
  alias AdventOfCode.Day3.Claim

  def run(input) do
    claims = input |> Enum.to_list()
    %Claim{id: id} = claims |> Enum.find(&no_overlap(&1, claims))
    id
  end

  defp no_overlap(%Claim{id: id, left: left, top: top, width: width, height: height}, claims) do
    claims
    |> Stream.reject(&(&1.id == id))
    |> Enum.all?(fn %Claim{
                      left: other_left,
                      top: other_top,
                      width: other_width,
                      height: other_height
                    } ->
      !(left < other_left + other_width && left + width > other_left &&
          top < other_top + other_height && top + height > other_top)
    end)
  end
end
