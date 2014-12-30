defmodule NotPartOfSipsTest do
  use ExUnit.Case

  def my_list do
    ["Jason", "Mary"]
  end

  test "list sigil" do
    assert ~w(Jason Mary) == my_list
  end

  test "pipe the head" do
    assert "Jason" == my_list |> hd
  end

  test "pipe the tail" do
    assert ["Mary"] == my_list |> tl
  end

  test "pipe the tail, pipe the head" do
    assert "Mary" == my_list |> tl |> hd
  end

  test "pipe the List.last" do
    assert "Mary" == my_list |> List.last
  end

  test "pipe the delete" do
    assert ["Mary"] == my_list |> List.delete("Jason")
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

  test "what does List.wrap do? puts brackets around things" do
    #there is no List.wrap/2
    assert [1] == 1 |> List.wrap
  end

  def my_map do
    %{boy: "Jason", girl: "Mary"}
  end

  test "what does Map.get do? it gets things. duh" do
    assert Map.get(my_map, :boy) == "Jason"
    assert Map.get(my_map, :girl) == "Mary"
  end

  test "what does access by key/symbol do? The same thing as get!" do
    assert my_map[:boy] == "Jason"
    assert my_map[:girl] == "Mary"
  end

  test "what does access by dot notation do? The same thing as get!" do
    assert my_map.boy == "Jason"
    assert my_map.girl == "Mary"
  end

  test "what does Map.fetch do? it returns an ok_tuple" do
    assert {:ok, "Jason"} == Map.fetch(my_map, :boy)
    # with pipes!!!
    assert {:ok, "Jason"} == my_map |> Map.fetch(:boy)
  end

  test "what does Map.put do? Changes values of keys." do
    assert Map.put(my_map, :boy, "Unjason")[:boy] == "Unjason"
    assert my_map |> Map.put(:boy, "Unjason") |> Map.get(:boy) == "Unjason"
  end

  test "invalid map keys? Returns nil." do
    assert my_map[:thing] == nil
    #now with more pipes!
    assert my_map |> Map.get(:thing) == nil
  end

  test "invalid dot notation? causes an error. Don't use it" do
    assert_raise KeyError, fn -> my_map.thing end
  end

  test "invalid Map.fetch? returns :error not ok_tuple" do
    err = my_map |> Map.fetch(:thing)
    assert err == :error
  end











end
