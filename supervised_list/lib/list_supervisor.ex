defmodule ListSupervisor do
  use Supervisor

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init(list) do
    child_process = [ worker(ListServer, list) ]
    supervise child_process, strategy: :one_for_one
  end


end