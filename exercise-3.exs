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

  def checker(n) do
    check(rem(n, 3), rem(n, 5), n)
  end

  def fizzbuzz(range) do
    fun = fn x -> checker(x) end
    range |> Enum.to_list |> Enum.map fun
  end

  def pretty(n) do
    n |> fizzbuzz |> Enum.join(", ")
  end

end


ExUnit.start()

defmodule TestFizzBuzz do
  use ExUnit.Case

  test "\"FizzBuzz\" is returned when first two args are zero" do
    result = FizzBuzz.check(0,0,"return me")
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

  test "checker gives FizzBuzz on n=15" do
    result = FizzBuzz.checker(15)
    assert result == "FizzBuzz"
  end

  test "checker gives Fizz on n=9" do
    result = FizzBuzz.checker(9)
    assert result == "Fizz"
  end

  test "checker gives Buzz on n=10" do
    result = FizzBuzz.checker(10)
    assert result == "Buzz"
  end

  test "checker gives n on prime number" do
    result = FizzBuzz.checker(11)
    assert result == "11"
  end

  test "the whole shabang of fizzing and buzzing" do
    result = FizzBuzz.fizzbuzz(10..16)
    assert result == ["Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16"]
  end

  test "pretty thing" do
    result = FizzBuzz.pretty(10..16)
    assert result == "Buzz, 11, Fizz, 13, 14, FizzBuzz, 16"
  end

end