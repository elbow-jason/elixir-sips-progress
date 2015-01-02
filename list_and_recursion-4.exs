defmodule MyList do
  def span(from, to) do
    Enum.to_list(from..to)
  end
end

ExUnit.start()

defmodule TestMyList do
  use ExUnit.Case

  test "a list comes out" do
    assert MyList.span(0, 5) == [0,1,2,3,4,5]
  end
end