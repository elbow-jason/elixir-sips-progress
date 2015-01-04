defmodule Calc do
   @type Option = {:ok, any} | nil

  def calculate(exp) do
    exp |> String.split |> do_calc
  end

  def do_calc([item1, op, item2])
  when is_binary(item1) and is_binary(item2)
  and op in ["+", "-", "*", "/"] do
    do_calc([String.to_integer(item1), op, String.to_integer(item2)])
  end

  def do_calc([item1, "+", item2]), do: item1 + item2
  def do_calc([item1, "-", item2]), do: item1 - item2
  def do_calc([item1, "*", item2]), do: item1 * item2
  def do_calc([item1, "/", item2]), do: item1 / item2

end

ExUnit.start()

defmodule TestCalc do
  use ExUnit.Case
  import Calc

  test "sum" do
    assert calculate("123 + 27") == 150
    assert calculate("2 + 2") == 4
  end

  test "diff" do
    assert calculate("2 - 2") == 0
  end

  test "times" do
    assert calculate("4 * 2") == 8
  end

  test "int_div" do
    # anything after the 16th digit is lost? i think?
    # and underscores are allowed

    #this is false so it is refuted
    refute calculate("2 / 3") === 0.66666_66666_66666_7

    #this works
    assert calculate("2 / 3") === 0.66666_66666_66666_6

    #grouped by three
    assert calculate("2 / 3") === 0.666_666_666_666_666_6

    #float imprecision is still a thing # just fyi
    refute 0.1 === 0.3 - 0.2

  end


end