defmodule WordCount.CounterAgentTest do
  use ExUnit.Case
  alias WordCount.CounterAgent

  setup do
    {:ok, agent} = CounterAgent.start_link(0)
    {:ok, agent: agent}
  end

  test "it starts with zero",
       %{agent: agent} do
    assert CounterAgent.value(agent) == 0
  end

  test "it adds number to state",
       %{agent: agent} do
    CounterAgent.add(2, agent)
    CounterAgent.add(3, agent)
    assert CounterAgent.value(agent) == 5
  end
end
