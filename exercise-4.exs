defmodule Prefix do

  def pre(title) do
    fn x -> "#{title} #{x}" end
  end

end

ExUnit.start()

defmodule TestPrefix do
  use ExUnit.Case

  test "pre returns a function" do
    fun = Prefix.pre("Mr.")
    assert is_function(fun) == true
  end

  test "function from pre returns the prefix then a space then the its arg" do
    mr = Prefix.pre("Mr.")
    result = mr.("Jason")
    assert result == "Mr. Jason"
  end

end
