defmodule MyList do
  def span_no_recurse(from, to) do
    Enum.to_list(from..to)
  end

  def span(from, to) when from <= to do
    [from] ++ [span(from+1, to)]
  end

end

ExUnit.start()

defmodule TestMyList do
  use ExUnit.Case

  test "a list comes out" do
    assert MyList.span_no_recurse(0, 5) == [0,1,2,3,4,5]
  end

  test "a list comes out" do
    assert MyList.span(0, 5) == [0,1,2,3,4,5]
  end

end