defmodule ExerciseOne do

  def main do
    list_concat = fn (a, b) -> a ++ b end
    result1 = list_concat.([:a, :b], [:c, :d]) == [:a, :b, :c, :d]
    IO.puts "list_concat works: #{result1}"

    sum = fn (a,b,c) -> a + b + c end
    result2 = sum.(1,2,3) == 6
    IO.puts "sum works: #{result2}"

    pair_tuple_to_list = fn {a,b} -> [a,b] end
    result3 = pair_tuple_to_list.({1234, 5678}) == [1234, 5678]
    IO.puts "pair_tuple_to_list works: #{result3}"

  end

end

ExerciseOne.main