
defmodule Fizz do

  def fizzbuzz(a, b) do
    a..b |> Enum.map( fn x -> fizzbuzz(x) end)
  end

  def fizzbuzz(x) do
    case { rem(x,3), rem(x,5), x} do
      {0,0,_} -> "FizzBuzz"
      {0,_,_} -> "Fizz"
      {_,0,_} -> "Buzz"
      {_,_,y} -> y
    end
  end
end

ExUnit.start()

defmodule TestFizzBuzz do

  use ExUnit.Case
  import Fizz

  test "fizzbuzz/1 makes the right choices" do
    assert fizzbuzz(5) == "Buzz"
    assert fizzbuzz(3) == "Fizz"
    assert fizzbuzz(15) == "FizzBuzz"
    assert fizzbuzz(1) == 1
  end

  test "fizzbuzz fizzes and buzzes properly" do
    f = "Fizz"
    b = "Buzz"
    result = fizzbuzz(10, 18)
    assert result == [b, 11, f, 13, 14, f<>b, 16, 17, f]
  end

end
