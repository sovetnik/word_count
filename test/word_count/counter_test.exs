defmodule WordCount.CounterTest do
  use ExUnit.Case
  alias WordCount.Counter

  @test_string " foo\sbar\n baz\t (boo) \n (woo\tzoo) "

  test "counts the words from stream" do
    {:ok, pid} = StringIO.open(@test_string)
    stream = IO.binstream(pid, :line)
    assert Counter.process(stream) == 6
  end

  test "counts the words from string" do
    assert Counter.count_words(@test_string) == 6
  end

  test "counts the words from empty string" do
    assert Counter.count_words("") == 0
  end

  test "counts string with unprintable chars" do
    assert Counter.count_words("\t\n\s") == 0
  end
end
