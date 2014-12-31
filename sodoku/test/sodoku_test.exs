defmodule SodokuTest do
  use ExUnit.Case

  test "solve returns true if the board is solved" do
    board = [
      [1,2],
      [2,1]
    ]

    assert solved?(board)
  end

  test "solve returns false if the board is not solved" do
    board = [
      [1,1],
      [2,1]
    ]
    refute solved?(board)
  end

end
