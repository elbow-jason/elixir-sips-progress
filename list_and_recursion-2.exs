defmodule MaxList do

  def max([x]) do
    x
  end

  def max([a,b | tail]) when a >= b do
    max([a | tail])
  end

  def max([a,b | tail]) when a < b do
    max([b | tail])
  end


end

ExUnit.start()

defmodule TestMaxList do
  use ExUnit.Case

  test "max gets max" do
    result = MaxList.max([17, 1, 2, 3, 5])
    assert result == 17
  end
end