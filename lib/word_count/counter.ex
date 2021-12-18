defmodule WordCount.Counter do
  @moduledoc "Counter module, which accepts stream"

  alias WordCount.CounterAgent
  alias WordCount.CounterTask

  def process(stream) do
    {:ok, agent} = CounterAgent.start_link(0)

    Task.async_stream(
      stream,
      CounterTask,
      :count_words,
      [agent],
      ordered: false
    )
    |> Stream.run()

    CounterAgent.value(agent)
  end
end
