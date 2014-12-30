defmodule FiboTest do
  use ExUnit.Case

  test "fib zero" do
    assert Fibo.fib(0) == []
  end

  test "fib one" do
    assert Fibo.fib(1) == [1]
  end

  test "fib two" do
    assert Fibo.fib(2) == [1,1]
  end

  test "fib six" do
    assert Fibo.fib(6) == [1,1,2,3,5,8]
  end

  test "fib 10" do
    assert Fibo.fib(10) == [1,1,2,3,5,8,13,21,34,55]
  end
end
