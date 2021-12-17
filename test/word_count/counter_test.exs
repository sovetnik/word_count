defmodule WordCount.CounterTest do
  use ExUnit.Case
  alias WordCount.Counter

  @test_string " foo\sbar\n baz\t (boo) \n (woo\tzoo) "

  test "counts the words from stream" do
    {:ok, pid} = StringIO.open(@test_string)
    stream = IO.binstream(pid, :line)
    assert Counter.process(stream) == 6
  end
end
