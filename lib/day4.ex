defmodule AdventOfCode.Day4 do
  defmodule Entry do
    defstruct [:id, :timestamp, :action]

    @pattern ~r/\[(?<timestamp>[^\]]+)\] (?<text>.+)/

    def from_string(s) do
      %{"timestamp" => timestamp, "text" => text} = Regex.named_captures(@pattern, s)

      %__MODULE__{
        id: id_from_text(text),
        timestamp: NaiveDateTime.from_iso8601!("#{timestamp}:00"),
        action: action_from_text(text)
      }
    end

    @id_pattern ~r/Guard #(?<id>\d+) .*/
    defp id_from_text(text) do
      if Regex.match?(@id_pattern, text) do
        %{"id" => id} = Regex.named_captures(@id_pattern, text)
        String.to_integer(id)
      end
    end

    defp action_from_text("wakes up"), do: :awake
    defp action_from_text("falls asleep"), do: :asleep
    defp action_from_text(_), do: :begin
  end

  def parse(lines) do
    lines
    |> Stream.map(&Entry.from_string/1)
    |> Enum.sort(&(NaiveDateTime.compare(&1.timestamp, &2.timestamp) != :gt))
  end

  def minutes_asleep(
        %Entry{id: id, timestamp: timestamp, action: :begin},
        {prev_id, asleep_since, minutes}
      ) do
    if !is_nil(asleep_since) do
      asleep_range = asleep_since..timestamp.minute
      {id, nil, Map.update(minutes, prev_id, [asleep_range], &[asleep_range | &1])}
    else
      {id, nil, minutes}
    end
  end

  def minutes_asleep(%Entry{timestamp: timestamp, action: :asleep}, {id, _, minutes}) do
    {id, timestamp.minute, minutes}
  end

  def minutes_asleep(%Entry{timestamp: timestamp, action: :awake}, {id, asleep_since, minutes}) do
    asleep_range = asleep_since..(timestamp.minute - 1)
    {id, nil, Map.update(minutes, id, [asleep_range], &[asleep_range | &1])}
  end

  use AdventOfCode.Day
end
