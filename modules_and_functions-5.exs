defmodule Gcd do
    def gcd(x,y) when x >= 0 and y == 0 do
    x
  end

  def gcd(x, y) when x >= 0 and y >= 0 do
    gcd(y, rem(x,y))
  end
end


ExUnit.start()

defmodule TestGcd do
  use ExUnit.Case

  test "gcd works one" do
    assert Gcd.gcd(24, 16) == 8
  end

  test "gcd works two" do
    assert Gcd.gcd(15, 30) == 15
  end

  test "gcd works three" do
    assert Gcd.gcd(88, 6) == 2
  end

  test "gcd works four" do
    assert Gcd.gcd(53, 23) == 1
  end
end 