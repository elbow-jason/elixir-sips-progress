defmodule Sodoku do
  def solved?(board) do
    :unfinished
  end


  def rows_solved?([]), do: true # base case
  def rows_solved?([row | rest]) do
    max = row |> Enum.count
    Enum.sort(row) == Enum.to_list(1..max) and rows_solved?(rest)
  end


  def cols_solved?(board) do
    
  end

  def flip(board) do
    :no
  end




  def cols_solved?(board) do
    :unfinished
  end
end
