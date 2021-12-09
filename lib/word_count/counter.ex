defmodule WordCount.Counter do
  @moduledoc "Counter module, which accepts stream"

  def process(stream) do
    Enum.reduce(
      stream,
      0,
      fn string, count -> count + count_words(string) end
    )
  end

  def count_words(string) do
    split(string)
    |> Enum.reduce(
      0,
      fn word, count -> count + is_word(word) end
    )
  end

  def split(string) do
    String.split(string, ~r/[\s\t\n]/)
  end

  defp is_word(""), do: 0
  defp is_word(_), do: 1
end
