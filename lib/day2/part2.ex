defmodule AdventOfCode.Day2.Part2 do
  def run(input) do
    ids = input |> Enum.to_list()

    {similarities, _differences} =
      ids
      |> Stream.flat_map(&get_differences(ids, &1))
      |> Enum.find(fn {_, differences} -> differences == 1 end)

    similarities
  end

  defp get_differences(ids, id) do
    ids
    |> Enum.map(fn other_id ->
      each_letter = Stream.zip(id, other_id)

      similarities =
        each_letter
        |> Stream.filter(fn {a, b} -> a == b end)
        |> Enum.map_join(fn {a, _} -> a end)

      differences =
        each_letter
        |> Stream.filter(fn {a, b} -> a != b end)
        |> Enum.count()

      {similarities, differences}
    end)
  end
end
