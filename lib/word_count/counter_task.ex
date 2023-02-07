defmodule WordCount.CounterTask do
  @moduledoc "Counter module, which accepts stream"

  alias WordCount.CounterAgent

  def count_words(string, agent) do
    split(string)
    |> Enum.reduce(%{}, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
    |> Enum.to_list()
    |> CounterAgent.add(agent)
  end

  defp split(string) do
    String.split(string, ~r/[\s\t\n]+/)
  end

  #defp is_word(""), do: 0
  #defp is_word(_), do: 1
end
