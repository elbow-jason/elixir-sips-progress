
defmodule FredNBetty do
  def start([]), do: listen
  def start([ person | rest ]) do
    listen
    send person, {:ok, self, "sent from start"}
    start(rest)
  end
  def listen do
    receive do
      {:ok, message } ->
        IO.puts "FredNBetty heard: #{message}"
    after 500 ->
      IO.puts "No more."
    end
  end
end

defmodule Betty do
  def hear do
    receive do
      {:ok, from, message} ->
        IO.puts "Betty heard #{message}"
        send from, {:ok, "Betty's message: #{message}"}
    end
  end
end

defmodule Fred do
  def hear do
    receive do
      {:ok, from, message} ->
        IO.puts "Fred heard #{message}"
        send from, {:ok, "Fred's message: #{message}"}
    end
  end
end


fred = spawn(Fred, :hear, [])
betty = spawn(Betty, :hear, [])
master = spawn(FredNBetty, :start, [[fred, betty]])

