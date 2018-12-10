defmodule AdventOfCode.Day7.Part2 do
  alias AdventOfCode.Day7

  def run(input, workers \\ 5, additional_seconds \\ 60) do
    input |> resolve(workers, additional_seconds)
  end

  defp resolve(graph, workers, additional_seconds) do
    graph
    |> Day7.starting_queue
    |> Enum.sort
    |> build(
      graph,
      Enum.reduce(1..workers, %{}, &Map.put(&2, &1, {nil, 0})),
      additional_seconds,
      MapSet.new(),
      0
    )
  end

  defp build([], graph, workers, at, completed, time) do
    if Enum.all?(workers, fn {_, {_, remaining}} -> remaining == 0 end) do
      time
    else
      %{tasks: new_tasks, workers: new_workers, completed: new_completed} =
        resolve([], workers, graph, completed, at)
      build(new_tasks, graph, new_workers, at, new_completed, time + 1)
    end
  end
  defp build(tasks, graph, workers, at, completed, time) do
    %{tasks: new_tasks, workers: new_workers, completed: new_completed} =
      resolve(tasks, workers, graph, completed, at)
    build(new_tasks, graph, new_workers, at, new_completed, time + 1)
  end

  defp resolve(tasks, workers, graph, completed, at) do
    %{assignments: assignments, remaining_tasks: remaining_tasks} =
      assign_workers(tasks, workers, graph, completed, at)

    %{tasks: unsorted_queue, workers: new_workers, completed: new_completed} =
      workers
      |> Map.merge(Map.new(assignments))
      |> Enum.reduce(%{tasks: remaining_tasks, workers: %{}, completed: completed}, fn
        {worker, {task, 1}}, %{tasks: ts, workers: ws, completed: cs} ->
          %{tasks: graph[task].children ++ ts, workers: Map.put(ws, worker, {nil, 0}), completed: MapSet.put(cs, task)}
        {worker, {nil, 0}}, %{workers: ws} = m -> %{m | workers: Map.put(ws, worker, {nil, 0})}
        {worker, {task, remaining}}, %{workers: ws} = m -> %{m | workers: Map.put(ws, worker, {task, remaining - 1})}
      end)

    new_tasks =
      unsorted_queue
      |> MapSet.new
      |> Enum.sort

    %{tasks: new_tasks, workers: new_workers, completed: new_completed}
  end

  defp assign_workers(tasks, workers, graph, completed, at) do
    available_workers =
      workers
      |> Stream.filter(fn {_, {_, remaining_time}} -> remaining_time == 0 end)
      |> Stream.map(fn {worker, _} -> worker end)
      |> Enum.sort

    assignments =
      tasks
      |> Stream.filter(fn task ->
        Enum.all?(graph[task].parents, &MapSet.member?(completed, &1))
      end) 
      |> Stream.zip(available_workers)
      |> Enum.map(fn {task, worker} -> {worker, {task, time_for(task) + at}} end)

    remaining_tasks =
      tasks
      |> Enum.reject(&Enum.any?(assignments, fn {_, {task, _}} -> task == &1 end))

    %{assignments: assignments, remaining_tasks: remaining_tasks}
  end

  @letter_to_time %{
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "D" => 4,
    "E" => 5,
    "F" => 6,
    "G" => 7,
    "H" => 8,
    "I" => 9,
    "J" => 10,
    "K" => 11,
    "L" => 12,
    "M" => 13,
    "N" => 14,
    "O" => 15,
    "P" => 16,
    "Q" => 17,
    "R" => 18,
    "S" => 19,
    "T" => 20,
    "U" => 21,
    "V" => 22,
    "W" => 23,
    "X" => 24,
    "Y" => 25,
    "Z" => 26,
  }
  defp time_for(x) do
    @letter_to_time[x] || 0
  end
end
