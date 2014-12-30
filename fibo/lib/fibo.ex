defmodule Fibo do

  def fib(n) do
    fib_p(n)
  end

  defp fib_p(n) when not is_integer(n) do
    :error
  end

  defp fib_p(n) when n < 0 do
    :error
  end

  defp fib_p(0), do: []
  defp fib_p(1), do: [1]
  defp fib_p(2), do: [1,1]

  defp fib_p(n) when n >= 3 do
    fib_p([2,1,1], n - 3)
  end

  defp fib_p(acc, 0) do
    acc |> Enum.reverse
  end

  defp fib_p([one, two | tail ], n) do
    fib_p([one+two] ++ [one, two] ++ tail, n-1)
  end
end
