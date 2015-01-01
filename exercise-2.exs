defmodule FizzBuzz do
  
  def check(0, 0, _) do
    "FizzBuzz"
  end

  def check(0, _, _) do
    "Fizz"
  end

  def check(_, 0, _) do
    "Buzz"
  end

  def check(_, _, x) do
    Integer.to_string(x)
  end

end


ExUnit.start()

defmodule TestFizzBuzz do
  use ExUnit.Case

  test "\"FizzBuzz\" is returned when first two args are zero" do
    result = FizzBuzz.check(0,0, 12)
    assert result == "FizzBuzz"
  end

  test "\"Fizz\" is returned when first arg is zero" do
    result = FizzBuzz.check(0, 12, "nope")
    assert result == "Fizz"
  end

  test "\"Buzz\" is returned when second arg is zero" do
    result = FizzBuzz.check(12, 0, "nope")
    assert result == "Buzz"
  end

  test "third arg is returned when neither two first args is zero" do
    result = FizzBuzz.check(12, 3, 4)
    assert result == "4"
  end

end