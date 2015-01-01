
defmodule Amper do
  def add_two(list) do
    list |> Enum.map &(&1+2)
  end

  def inspect(list) do
    list |> Enum.each &(IO.inspect(&1))
  end
end

ExUnit.start()

defmodule TestAmper do
  use ExUnit.Case

  test "add_two works" do
    assert Amper.add_two([1,2,3,4]) == [3,4,5,6]
  end

  test "inspect works" do
    assert Amper.inspect([1,2,3,4]) == :ok
  end
  
end