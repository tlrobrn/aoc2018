defmodule Mix.Tasks.Gen.Day do
  use Mix.Task
  alias Mix.Generator

  @shortdoc "Generate a day's files"

  def run([day]) do
    Generator.create_file("lib/day#{day}.ex", """
    defmodule AdventOfCode.Day#{day} do
      use AdventOfCode.Day
    end
    """)

    Generator.create_file("test/day#{day}_test.exs", """
    defmodule AdventOfCode.Day#{day}.Test do
      use ExUnit.Case
      alias AdventOfCode.Day#{day}
    end
    """)

    Generator.create_directory("lib/day#{day}")
    Generator.create_directory("test/day#{day}")
    1..2 |> Enum.map(&create_part_files(day, &1))
  end

  defp create_part_files(day, part) do
    Generator.create_file("lib/day#{day}/part#{part}.ex", """
    defmodule AdventOfCode.Day#{day}.Part#{part} do
      def run(input) do
      end
    end
    """)

    Generator.create_file("test/day#{day}/part#{part}_test.exs", """
    defmodule AdventOfCode.Day#{day}.Part#{part}.Test do
      use ExUnit.Case
      alias AdventOfCode.Day#{day}.Part#{part}
    end
    """)
  end
end
