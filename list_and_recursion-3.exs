defmodule Caesar do

  def caesar([], _n), do: []

  def caesar([ head | tail ], n) 
    when head in ?a..?z and n > 0 do
    do_caesar(head, n, ?a, tail)
  end

  def caesar([ head | tail ], n) 
    when head in ?A..?Z and n > 0 do
    do_caesar(head, n, ?A, tail)
  end

  defp do_caesar(alpha, n, first, tail) do 
    [ rem(alpha-first + n, 26) + first  | caesar(tail, n) ]
  end

end

ExUnit.start()

defmodule TestCaesar do
  use ExUnit.Case

  test "caesar encrypts" do
    assert Caesar.caesar('abc', 1) == 'bcd'
    assert Caesar.caesar('abc', ?a) == 'tuv'
  end

  test "caesar wraps xyz with 1 to make yza" do
    assert Caesar.caesar('xyz', 1) == 'yza'
  end

  test "caesar encrypts capitals" do
    assert Caesar.caesar('Abc', 1) == 'Bcd'
  end

  test "caesar wraps xyZ with 1 to make yzA" do
    assert Caesar.caesar('xyZ', 1) == 'yzA'
  end

  test "caesar errors with invalid key" do
    assert_raise(FunctionClauseError,
      fn ->
        Caesar.caesar('abc', -1)
      end)

    assert_raise(ArithmeticError,
      fn ->
        Caesar.caesar('abc', 'somthing crazy')
      end)
  end

end
