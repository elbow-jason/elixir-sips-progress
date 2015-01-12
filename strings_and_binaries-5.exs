ExUnit.start()

defmodule Dqs do
  use ExUnit.Case

  @animals ["cat", "zebra", "elephant"]

  def center(list) do
    list
    |> get_longest_length
  end

  def get_longest_length(list) do
    word = Enum.max_by(list, fn(x) -> String.length(x) end)
    {list, String.length(word)}
  end

  def centerify(long_len, list) when is_list list do
    {:ok, list, long_len}
  end


  def pad(word, long_len) do
    {:ok, word, long_len}
  end

  test "center centers words" do
    assert center(@animals) == {@animals, 8}
  end
  
  test "get_longest gets longest word from a list" do
    assert get_longest_length(@animals) == {@animals, 8}
  end
end