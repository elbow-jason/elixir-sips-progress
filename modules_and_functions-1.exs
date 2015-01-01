defmodule Times do
  def single(x), do: x
  def double(x), do: x * 2
  def triple(x), do: x * 3
  def quadruple(x), do: x |> double |> double
end

ExUnit.start()

defmodule TestTimes do
  use ExUnit.Case

  test "single returns the same" do
    result = Times.single(4)
    assert result == 4
  end

  test "double returns the double the number" do
    result = Times.double(4)
    assert result == 8
  end


  test "triple returns the triple the number" do
    result = Times.triple(4)
    assert result == 12
  end

  test "quadruple returns quadruple the number" do
    result = Times.quadruple(4)
    assert result == 16
    result = Times.quadruple(5)
    assert result == 20
  end

end