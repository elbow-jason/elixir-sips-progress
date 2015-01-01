defmodule Recursum do
  def sum(0), do: 0
  def sum(n) when n > 0 do
    n + sum(n-1)
  end

  def sum(n) when n < 0 do
    n + sum(n+1)
  end
end

ExUnit.start()

defmodule TestRecursum do
  use ExUnit.Case

  test "sum(0) is 0" do
    assert Recursum.sum(0) == 0
  end

  test "sum(4) is 10" do
    assert Recursum.sum(4) == 10
  end

  test "sum(-5) is -15" do
    assert Recursum.sum(-5) == -15
  end

end