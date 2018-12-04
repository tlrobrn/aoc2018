defmodule Mix.Tasks.Star do
  use Mix.Task

  @shortdoc "Run a DAY and PART"

  def run([day, part]) do
    result =
      [Elixir, :AdventOfCode, "Day#{day}"]
      |> Module.concat()
      |> apply(:"part#{part}", [])

    IO.puts("Day #{day} Part #{part}: #{result}")
  end
end
