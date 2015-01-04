
defmodule Bangit do

  def ok!(result) do
    case result do
      {:ok, data} -> data
      {:error, err} -> raise err
      _ -> result
    end
  end

end

ExUnit.start()

defmodule TestBangit do
  use ExUnit.Case
  import Bangit

  test "ok! behaves itself" do
    assert ok!({:ok, "some_data"}) == "some_data"

    assert_raise RuntimeError, "something went wrong", fn ->
      ok!({:error, "something went wrong"})
    end 

    assert ok!(1) == 1
  end

end
