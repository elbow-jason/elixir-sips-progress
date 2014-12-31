
defmodule Commando do

  def echo(input) do
    IO.puts "#{input}"
  end

  def numify(strings) do
    Enum.map strings, &(String.to_integer &1)
  end

  def add(nums) do
    fun = fn(x,y) -> x+y end
    result = nums |> numify |> Enum.reduce(0, fun)
    IO.puts "Result of adding #{inspect nums} is #{result}"
  end

  def handle_args([]) do
    IO.puts "Nothing"
  end

  def handle_args([arg | tail]) when arg == "echo" do
    echo(tail)
  end

  def handle_args([arg | tail]) when arg == "add" do
    IO.puts "adding #{inspect tail}"
    add(tail)
  end

  def handle_args(_) do
    IO.puts "Unrecognized command"
  end
end

case System.argv do
  args ->
    Commando.handle_args(args)
  _ ->
    IO.puts "something unexpected happened"
end

#ExUnit.start()
#defmodule TestCommando do
#  use ExUnit.Case
#  test "numify turns a list of stringified numbers into a list of ints" do
#    list = ["3", "3"]
#    real_nums = list |> Commando.numify
#    assert real_nums == [3,3]
#  end
#end
