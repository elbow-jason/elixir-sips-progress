defmodule MyList do

  def flatten(list) do
    do_flatten(list, [])
  end

  defp do_flatten([], acc) do
    acc
  end

  defp do_flatten([head | tail], acc)
    when is_list(head) do
    do_flatten(head, []) ++ do_flatten(tail, acc)
  end

  defp do_flatten( [head | tail], acc ) do
    [head] ++ do_flatten(tail, acc)
  end

end

ExUnit.start()

defmodule TestMyList do
  use ExUnit.Case

  test "MyList.flatten works like " do
    nested = [[1,2,3],[4,5,6,[7,8]]]
    assert List.flatten(nested) == MyList.flatten(nested)
  end

end