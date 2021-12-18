defmodule WordCount.CounterAgent do
  @moduledoc "Counter module, which accepts stream"

  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value(agent) do
    Agent.get(agent, & &1)
  end

  def add(number, agent) do
    Agent.update(
      agent,
      fn state -> state + number end
    )
  end
end
