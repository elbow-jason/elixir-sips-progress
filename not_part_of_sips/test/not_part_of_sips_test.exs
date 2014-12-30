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

  test "pipe the List.last" do
    assert "Mary" == NotSip.my_list |> List.last
  end

  test "pipe the delete" do
    assert ["Mary"] == NotSip.my_list |> List.delete("Jason")
  end

  test "what does foldr do?" do
    list = [1,2,3,4]
    sum = List.foldr list, 0, fn x, y -> x + y end
    assert sum == 10
  end

  test "what does foldl do?" do
    list = [1,2,3,4]
    sum = List.foldl list, 0, fn x, y -> x + y end
    assert sum == 10
  end
end
