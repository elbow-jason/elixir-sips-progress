defmodule Ringer do
  @doc """
    passes message to next ringer in the ring
  """

  def ping(echo, limit) do
    receive do
      # receive count under limit then pass message to ringers
      {[next | rest], msg, count} when count <= limit ->
        IO.puts "Rx: #{inspect msg} (count #{count})"
        :timer.sleep 1000
        send next, {rest ++ [next], echo, count+1}
        ping(echo, limit)

      # receive count over limit begin the 'shutdown'. send :ok to ringers
      {[next | rest], _, _} ->
        send next, {rest, :ok}

      # receive :ok symbol then pass :ok on after removing next from list.
      {[next | rest], :ok} ->
        send next, {rest, :ok}

      # base case
      # list of ringers is empty! we are finished. return :ok
      {[], :ok} -> :ok
    end
  end
end

defmodule Spawner do
  def start do
    limit = 5
    one = Process.spawn(Pinger, :ping, ["ping", limit], [])
    two = Process.spawn(Pinger, :ping, ["ping", limit], [])
    tre = Process.spawn(Pinger, :ping, ["ping", limit], [])
    send one, {[two, tre, one], "start", 0}
    wait [one, two, tre]
  end

  def wait(pids) do
    IO.puts "waiting for pids #{inspect pids}"
    receive do
      {:DOWN, _, _, pid, _} ->
        IO.puts "#{inspect pid} quit"
        pids = pids |> List.delete(pid)
        unless Enum.empty?(pids) do
          wait(pids)
        end
    end
  end
end

Spawner.start
