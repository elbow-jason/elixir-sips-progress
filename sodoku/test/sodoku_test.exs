defmodule SodokuTest do
  use ExUnit.Case

  import Sodoku

  test "solve returns true if the board is solved" do
    board = [
      [1,2],
      [2,1]
    ]

    assert solved?(board) == true
  end

  test "solve returns false if the board is not solved" do
    board = [
      [1,1],
      [2,1]
    ]
    assert solved?(board) == false
  end


  test "rows_solved? returns true when rows are solved" do
    board = [
      [1,2],
      [1,2]
    ]
    assert rows_solved?(board) == true
  end

  test "rows_solved? returns false when rows are not solved" do
    board = [
      [1,1],
      [2,2]
    ]
    assert rows_solved?(board) == false
  end

  test "cols_solved? returns false when cols are not solved" do
    board = [
      [1,2],
      [1,2]
    ]
    assert cols_solved?(board) == false
  end


  test "cols_solved? returns true when cols are solved" do
    board = [
      [2,2],
      [1,1]
    ]
    assert cols_solved?(board) == true
  end


end
