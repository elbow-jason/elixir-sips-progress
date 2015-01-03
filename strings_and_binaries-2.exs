defmodule MyStr do

  def anagram?(word1, word2) do
    chars1 = word1 |> String.to_char_list
    chars2 = word2 |> String.to_char_list
    is_subset?(chars1, chars2) and is_subset?(chars2, chars1)
  end

  def is_subset?(set_one, set_two) do
    set_one |> Enum.all?(fn ch -> ch in set_two end)
  end

end


ExUnit.start()


defmodule TestMyStr do
  use ExUnit.Case

  test "anagram?/2 works" do
    assert MyStr.anagram?("jason", "asjon") == true
    assert MyStr.anagram?("abc", "def") == false
    assert MyStr.anagram?("not same", "not_same") == false
  end

  test "is_subset? works" do
    assert MyStr.is_subset?('abc', 'abcd') == true
    assert MyStr.is_subset?('abcd', 'abcd') == true
    assert MyStr.is_subset?('abcd', 'abc') == false
  end

end