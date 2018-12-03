defmodule Day2.Part2 do
  @input "./input.txt"

  def run do
    ids = @input
    |> File.stream!
    |> Stream.map(&String.trim/1)
    |> Enum.map(&String.graphemes/1)

    ids
    |> Stream.flat_map(&get_differences(ids, &1))
    |> Enum.find(fn {_, differences} -> differences == 1 end)
    |> IO.inspect
  end

  defp get_differences(ids, id) do
    ids
    |> Enum.map(fn other_id ->
      each_letter = Stream.zip(id, other_id)

      similarities = each_letter
      |> Stream.filter(fn {a, b} -> a == b end)
      |> Enum.map_join(fn {a, _} -> a end)

      differences = each_letter
      |> Stream.filter(fn {a, b} -> a != b end)
      |> Enum.count

      {similarities, differences}
    end)
  end
end

Day2.Part2.run()
