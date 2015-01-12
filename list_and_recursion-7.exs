defmodule MyList do
  def span_no_recurse(from, to) do
    Enum.to_list(from..to)
  end

  def span(low, high) when low == high do
    [low]
  end

  def span(high, low) when high > low do
    [high] ++ span(high - 1, low)
  end

  def span(low, high) when low < high do
    [low] ++  span(low + 1, high)
  end

  def primes(n)  do
    all = span(2, n)
    not_prime = for a <- all, b <- span(2, div(a, 2)), rem(a, b) == 0, do: a
    all -- not_prime
  end

  def prime?(n) when n < 0, do: false
  def prime?(0), do: false
  def prime?(1), do: false
  def prime?(2), do: true
  def prime?(n) when n > 2 do
    (for x <- span(2, n-1), do: x)
    |> Enum.map(fn (x) -> not is_divisible(n, x) end)
    |> Enum.any?
  end

  def is_divisible(n, x) when x == 0 or n == 0, do: false
  def is_not_divisible(n, x) do
    rem(n, x) != 0
  end

end

ExUnit.start()

defmodule TestMyList do
  use ExUnit.Case

  test "a list comes out" do
    assert MyList.span_no_recurse(0, 5) == [0,1,2,3,4,5]
  end

  test "a list comes out correctly" do
    assert MyList.span(0, 5) == [0,1,2,3,4,5]
  end

  test "and backwards" do
    assert MyList.span(5, 0) == [5,4,3,2,1,0]
  end

  test "prime???" do
    assert MyList.prime?(1) == false
    assert MyList.prime?(2) == true
    assert MyList.prime?(3) == true
    assert MyList.prime?(4) == false
    assert MyList.prime?(4) == false
    assert MyList.prime?(5) == true
    assert MyList.prime?(6) == false
    assert MyList.prime?(7) == true
  end

  test "primes works" do
    assert MyList.primes(10) == [2,3,5,7]
  end

  test "is_divisible works" do
    assert MyList.is_divisible(2, 1) == true
    assert MyList.is_divisible(5, 2) == false
    assert MyList.is_divisible(5, 2) == false
    assert MyList.is_divisible(10, 3) == false
  end


end
