
defmodule Primus do

  defp eratos(composites, n, acc) when acc == n do
    Enum.to_list(2..n+1) -- composites
  end

  defp eratos(n, composites, acc) when acc < n do
    (for x <- Enum.to_list(2..n+1), do: x)
      |> Stream.filter(fn(x) -> not x in composites end)
      |> Enum.map( &(squarify(&1, n) ) )
      |> List.flatten
      |> Enum.concat(composites)
      |> Enum.uniq
      |> eratos(n, acc+1)
  end

  def squarify(x, n) do
    low = x*x
    Enum.to_list(low..n+1) |> Enum.filter(fn(x) -> rem(x,n) == 0 end)
  end

  def primes(n) do
    eratos([], n, 0)
  end

end

ExUnit.start()

defmodule TestPrimus do
  use ExUnit.Case

  test "shatter something" do
    assert Primus.primes(3) == [2,3,5,7]
  end

end