defmodule Mapsum do

  def mapsum(list, fun) do
    list |> Enum.map(fun) |> sum
  end

  defp sum([]), do: 0
  defp sum([head | tail]) do
    head + sum(tail)
  end

end

ExUnit.start()

defmodule TestMapsum do
  use ExUnit.Case

  test "mapsum works" do
    assert Mapsum.mapsum([1,2,3,4], fn(x) -> x+2 end) == 18
  end

  test "mapsum funny" do
    assert Mapsum.mapsum([1,2,3,4], &(&1 * 0)) == 0
  end

  test "mapsum square" do
    assert Mapsum.mapsum([1,2,3,4], &(&1 * &1)) == 1+4+9+16
  end

end