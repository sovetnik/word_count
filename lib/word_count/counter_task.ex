defmodule WordCount.CounterTask do
  @moduledoc "Counter module, which accepts stream"

  alias WordCount.CounterAgent

  def count_words(string, agent) do
    split(string)
    |> Enum.reduce(
      0,
      fn word, count ->
        count + is_word(word)
      end
    )
    |> CounterAgent.add(agent)
  end

  defp split(string) do
    String.split(string, ~r/[\s\t\n]+/)
  end

  defp is_word(""), do: 0
  defp is_word(_), do: 1
end
