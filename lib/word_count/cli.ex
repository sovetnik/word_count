defmodule WordCount.CLI do
  @moduledoc "Command line interface"

  alias WordCount.Counter

  def main(args) do
    args |> parse_args |> process_args
  end

  def parse_args(args) do
    {params, _, _} = OptionParser.parse(args, switches: [help: :boolean, file: :string])

    params
  end

  defp process_args(file: filename) do
    case check_file(filename) do
      false ->
        IO.puts("File #{filename} is not exists")

      true ->
        IO.puts(Counter.process(stream_file(filename)))
    end
  end

  defp process_args(help: true) do
    IO.puts("\nThe WordCount counts words in given text file")
    IO.puts("and receive only one parameter at once\n")
    IO.puts("Example: ./word_count --file file.txt\n")
    IO.puts("Print this message again: ./word_count --help\n")
  end

  defp process_args(_) do
    IO.puts("The WordCount counts words in given text file\n")
    IO.puts("RTFM: ./word_count --help\n")
  end

  defp check_file(filename) do
    File.exists?(filename)
  end

  defp stream_file(filename) do
    File.stream!(filename)
  end
end
