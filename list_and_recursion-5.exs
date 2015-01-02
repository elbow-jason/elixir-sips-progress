defmodule MyEnum do


  def all?([head | tail], fun) do
    do_all?(tail, fun, fun.(head))
  end

  defp do_all?([], _fun, verity) do
    verity
  end

  defp do_all?(_list, _fun, false) do
    false
  end

  defp do_all?([ head | tail ], fun, true) do
    do_all?(tail, fun, fun.(head))
  end


  def each([], _fun), do: :ok

  def each([ head | tail ], fun) do
    fun.(head)
    each(tail, fun)
  end


  def filter(list, fun) do
    do_filter(list, fun, [])
  end

  defp do_filter([], _fun, results), do: results

  defp do_filter([head | tail], fun, results) do
    if fun.(head) do
      do_filter(tail, fun, results ++ [head])
    else
      do_filter(tail, fun, results)
    end
  end

  def split(list, target) do
    do_split(list, [], target)
  end

  defp do_split(list, first, target)
    when length(first) == target do
    {first, list}
  end

  defp do_split([head | tail], first, target)
    when length(first) < target do
    do_split(tail, first ++ [head], target)
  end


  def take(list, num) do
    do_take(list, num, [])
  end

  defp do_take(_list, num, rtn) when length(rtn) == num do
    rtn
  end

  defp do_take([ head | tail ], num, rtn) when length(rtn) < num do
    do_take(tail, num, rtn ++ [head])
  end


end

ExUnit.start()

defmodule TestMyEnum do
  use ExUnit.Case

  test "all? works like Enum.all?" do
    fun = fn(x) -> rem(x, 2) == 0 end
    nums = [1,2,3,4,5]
    evens = [2,4,6,8]
    assert Enum.all?(nums, fun) == MyEnum.all?(nums, fun)
    assert Enum.all?(evens, fun) == MyEnum.all?(evens, fun)
  end

  test "MyEnum.each works like Enum.each" do
    fun = fn(x) -> IO.puts "#{x}" end
    nums = [1,2,3,3,4]
    assert Enum.each(nums, fun) == MyEnum.each(nums, fun)
  end

  test "MyEnum.filter works like Enum.filter" do
    fun = fn(x) -> x > 2 end
    nums = [1,2,3,3,4]
    assert Enum.filter(nums, fun) == MyEnum.filter(nums, fun)
  end

  test "MyEnum.split works like Enum.split" do
    nums = [1,2,3,3,4]
    assert Enum.split(nums, 2) == MyEnum.split(nums, 2)
  end

  test "MyEnum.split works like Enum.split" do
    nums = [3,3,3,3,3]
    assert Enum.take(nums, 2) == MyEnum.take(nums, 2)
  end



end