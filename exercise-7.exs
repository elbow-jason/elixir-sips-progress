defmodule Seven do
  def float_to_string(num) do
    num
      |> :erlang.float_to_list([{:decimals, 2}])
      |> to_string
  end
end

Seven.float_to_string(1.523)

ExUnit.start()

defmodule TestSeven do
  use ExUnit.Case

  test "float_to_string returns a string" do
    result = Seven.float_to_string(1.55555)
    assert result == "1.56"
  end

end