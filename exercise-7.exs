defmodule Seven do
  def float_to_string(num) do
    num
      |> :erlang.float_to_list([{:decimals, 2}])
      |> to_string
  end

  def get_os_var(varname) do
    System.get_env(varname)
  end

  def get_extentsion(path) do
    Path.extname(path)
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

  test "get os environment var" do
    put_worked = System.put_env("WTF", "CUH")
    result = Seven.get_os_var("WTF")
    IO.puts result
    assert put_worked == :ok
    assert result == "CUH"
    deleted = System.delete_env("WTF")
    assert deleted == :ok
  end

  test "get_extentsion returns the file extension" do
    assert Seven.get_extentsion("jason/elx.ixir") == ".ixir"
  end
  


end