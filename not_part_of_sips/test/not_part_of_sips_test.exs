defmodule NotPartOfSipsTest do
  use ExUnit.Case

  test "list sigil" do
    assert ~w(Jason Mary) == NotSip.my_list
  end

  test "pipe the head" do
    assert "Jason" == NotSip.my_list |> hd
  end

  test "pipe the tail" do
    assert ["Mary"] == NotSip.my_list |> tl
  end

  test "pipe the tail, pipe the head" do
    assert "Mary" == NotSip.my_list |> tl |> hd
  end


  test "the truth" do
    assert 1 + 1 == 2
  end
end
