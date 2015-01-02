defmodule Streamo do

  def fib(0), do: []
  def fib(1), do: [1]
  def fib(2), do: [1,1]

  def fib(n) do
    gen_fib = fn (x) -> do_fib(x) end

    Stream.unfold({0,1}, gen_fib)
      |> Enum.take(n+1) |> tl
  end

  defp do_fib({first, second}) do
    {first, {second, first + second}}
  end

end

ExUnit.start()

defmodule TestStreamo do
  use ExUnit.Case

  test "fib works" do
    assert Streamo.fib(7) == [1,1,2,3,5,8,13]
  end
end