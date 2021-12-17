defmodule WordCount.CounterTaskTest do
  use ExUnit.Case
  alias WordCount.CounterTask

  @test_string " foo\sbar\n baz\t (boo) \n (woo\tzoo) "

  test "counts the words from string" do
    assert CounterTask.count_words(@test_string) == 6
  end

  test "counts the words from empty string" do
    assert CounterTask.count_words("") == 0
  end

  test "counts string with unprintable chars" do
    assert CounterTask.count_words("\t\n\s") == 0
  end
end
