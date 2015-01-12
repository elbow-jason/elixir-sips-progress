defmodule Parent do
  def run do
    child = spawn_monitor(Child, :speak_n_exit, [self])
    :timer.sleep 500
    receive do
      resp ->
        IO.puts resp
    end
    
  end
end

defmodule Child do
  def speak_n_exit(pid) do
    send pid, "I respond!!!"
    exit(:kaboom)
  end
end

Parent.run()