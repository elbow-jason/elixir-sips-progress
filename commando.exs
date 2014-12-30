
defmodule Commando do
  def echo(input) do
    IO.puts "#{input}"
  end

  #base case
  def add(acc, []) do
    acc
  end

  def add(acc, [head | tail])
    add(acc+head, tail)
  end

  def handle_args([]) do
    IO.puts "Nothing"
  end

  def handle_args([arg | tail]) when arg == "echo" do
    echo(tail)
  end

  def handle_args([arg | tail]) when arg == "add" do
    add(0, tail)
  end

  def handle_args(_) do
    IO.puts "Unrecognized command"
  end


  case System.argv do
    args ->
      Commando.handle_args(args)
      _ ->
        IO.puts "something unexpected happened"
end
