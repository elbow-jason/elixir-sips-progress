defmodule Guess do

	def guess(num, low..high) do
		is_match(num, low, high, low + half(high - low))
	end

	def half(range) do
		range/2 |> Float.round(0) |> Kernel.trunc
	end

	def is_match(num, _low, high, new_guess) when num > new_guess do
		IO.puts "#{new_guess} was too low"
		guess(num, new_guess+1..high)
	end

	def is_match(num, low, _high, new_guess) when num < new_guess do
		IO.puts "#{new_guess} was too high"
		guess(num, low..new_guess-1)
	end

	def is_match(num, _low, _high, new_guess) when num == new_guess do
		IO.puts "Excellent! Number was #{num}. Guess was #{new_guess}"
		:ok
	end

end

ExUnit.start()

defmodule TestGuess do
	use ExUnit.Case

	test "half returns a whole number" do
		even = Guess.half(4)
		odd  = Guess.half(7)
		three = Guess.half(6)

		assert even  |> is_integer
		assert odd   |> is_integer
		assert three |> is_integer

		assert even === 2
		assert odd === 4
		assert three === 3
	end

	test "higher than num returns :high" do
		assert Guess.is_match(100, 0, 200, 150) == :ok
	end

	test "new_guess lower than num returns :low" do
		assert Guess.is_match(100, 0, 200, 50) == :ok
	end

	test "new_guess equals num returns :match" do
		assert Guess.is_match(100, 0, 200, 100) == :ok
	end



end