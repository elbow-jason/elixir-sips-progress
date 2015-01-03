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

end
