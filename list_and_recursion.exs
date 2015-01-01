defmodule Summer do

  def sum([]), do: 0
  def sum([head|tail]) do
    head + sum(tail)
  end

end

ExUnit.start()

defmodule TestSummer do
  use ExUnit.Case

  test "sum will sum a list" do
    list = [1,2,3,4]
    assert Summer.sum(list) == 10
  end

  test "sum of empty list is zero" do
    result = Summer.sum([])
    assert result == 0
  end

end