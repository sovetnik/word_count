defmodule WordCount.CounterTaskTest do
  use ExUnit.Case

  alias WordCount.CounterAgent
  alias WordCount.CounterTask

  setup do
    {:ok, agent} = CounterAgent.start_link(0)
    {:ok, agent: agent}
  end

  @test_string " foo\sbar\n baz\t (boo) \n (woo\tzoo) "

  test "counts the words from string",
       %{agent: agent} do
    assert CounterTask.count_words(@test_string, agent) == :ok
    assert CounterAgent.value(agent) == 6
  end

  test "counts the words from empty string",
       %{agent: agent} do
    assert CounterTask.count_words("", agent) == :ok
    assert CounterAgent.value(agent) == 0
  end

  test "counts string with unprintable chars",
       %{agent: agent} do
    assert CounterTask.count_words("\t\n\s", agent) == :ok
    assert CounterAgent.value(agent) == 0
  end
end
