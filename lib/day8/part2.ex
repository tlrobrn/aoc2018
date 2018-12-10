defmodule AdventOfCode.Day8.Part2 do
  def run(input) do
    input
    |> Enum.with_index()
    |> build_tree
    |> root_value
  end

  defp build_tree(input, stack \\ [], tree \\ %{})

  defp build_tree([], [], tree) do
    # Reverse the children so indexing is more straightforward
    tree
    |> Stream.map(fn {key, %{children: children} = node} ->
      {key, %{node | children: Enum.reverse(children)}}
    end)
    |> Map.new()
  end

  defp build_tree([{a, i}, {b, _} | tail], [], tree),
    do: build_tree(tail, [{i, a, b}], Map.put(tree, i, %{children: [], meta: []}))

  defp build_tree(input, [{_, 0, 0} | stack], tree),
    do: build_tree(input, stack, tree)

  defp build_tree([{m, _} | tail], [{i, 0, n} | stack], tree) do
    build_tree(
      tail,
      [{i, 0, n - 1} | stack],
      Map.update(tree, i, %{children: [], meta: [m]}, &%{&1 | meta: [m | &1.meta]})
    )
  end

  defp build_tree([{a, i}, {b, _} | tail], [{p, n, m} | stack], tree) do
    build_tree(
      tail,
      [{i, a, b}, {p, n - 1, m} | stack],
      Map.update(tree, p, %{children: [i], meta: []}, &%{&1 | children: [i | &1.children]})
    )
  end

  defp root_value(tree), do: value(tree[0], tree)

  defp value(%{children: [], meta: meta}, _tree), do: Enum.sum(meta)

  defp value(%{children: children, meta: meta}, tree) do
    meta
    |> Stream.map(&Enum.at(children, &1 - 1))
    |> Stream.reject(&is_nil/1)
    |> Stream.map(&value(tree[&1], tree))
    |> Enum.sum()
  end
end
