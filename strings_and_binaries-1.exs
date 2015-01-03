defmodule Asskey do

  @asciis ?\s..?~

  def is_ascii?([]) do
    false
  end

  @doc """
  If the arg is an empty list false is returned.
  If the arg is a list priv function do_is_ascii is called
  If and head is not an integer that is greater than 32 and
  less than 126 then false is returned. 
  If the head is valid the tail is passed recursively and
  the evaluation begins again. Finally, when the list is
  emptied true is returned. 
  """ 
  def is_ascii?(word) when is_list(word) do
    do_is_ascii?(word)
  end

  defp do_is_ascii?([]) do
    true
  end

  defp do_is_ascii?([ head | tail ]) 
    when is_integer(head) and head > ?\s and head < ?~ do
    do_is_ascii?(tail)
  end

  defp do_is_ascii?(_list) do
    false
  end


  def daves_ascii?(sqs), do: Enum.all?(sqs, fn ch -> ch in ? ..?~ end)
end


ExUnit.start()

defmodule TestAsskey do
  use ExUnit.Case
  
  test "is_ascii? works" do
    assert Asskey.is_ascii?('cat') == true
    assert Asskey.is_ascii?([11111,11111,111111]) == false
    assert Asskey.is_ascii?([]) == false
  end

  
  test "daves_ascii? works" do
    assert Asskey.daves_ascii?('cat') == true
    assert Asskey.daves_ascii?([11111,11111,111111]) == false
    assert Asskey.daves_ascii?([]) == true
  end


end