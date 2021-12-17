defmodule WordCount.Counter do
  @moduledoc "Counter module, which accepts stream"

  alias WordCount.CounterTask

  def process(stream) do
    Task.async_stream(
      stream,
      CounterTask,
      :count_words,
      [],
      ordered: false
    )
    |> Enum.reduce(
      0,
      fn {:ok, num}, acc -> num + acc end
    )
  end
end
