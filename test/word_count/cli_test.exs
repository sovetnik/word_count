defmodule WordCount.CLITest do
  use ExUnit.Case
  alias WordCount.CLI
  import ExUnit.CaptureIO

  @existing_filename "README.md"
  @non_existing_filename "non_exist.md"

  test "count words if file exists" do
    assert CLI.main(["--file", @existing_filename]) == :ok

    assert capture_io(fn ->
             CLI.main(["--file", @existing_filename])
           end) == "39\n"
  end

  test "warns if file not exists" do
    assert CLI.main(["--file", @non_existing_filename]) == :ok

    assert capture_io(fn ->
             CLI.main(["--file", @non_existing_filename])
           end) == "File non_exist.md is not exists\n"
  end

  test "shows the help" do
    assert CLI.main(["--help"]) == :ok

    assert capture_io(fn ->
             CLI.main(["--help"])
           end) ==
             "\nThe WordCount counts words in given text file\nand receive only one parameter at once\n\nExample: ./word_count --file file.txt\n\nPrint this message again: ./word_count --help\n\n"
  end

  test "suggest RTFM when wrong args" do
    assert CLI.main(["shit happens"]) == :ok

    assert capture_io(fn -> CLI.main(["shit happens"]) end) ==
             "The WordCount counts words in given text file\n\nRTFM: ./word_count --help\n\n"
  end

  test "suggest RTFM when no args" do
    assert CLI.main([]) == :ok

    assert capture_io(fn -> CLI.main([]) end) ==
             "The WordCount counts words in given text file\n\nRTFM: ./word_count --help\n\n"
  end
end
