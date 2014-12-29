defmodule ListSupervisor do
  use Supervisor

  def start_link do
    result = {:ok, sup} = :supervisor.start_link(__MODULE__, [])
    start_workers(sup)
    result
  end

  def start_workers(sup) do
    #start the ListData Worker
    {:ok, list_data} = :supervisor.start_child(sup, worker(ListData, []))
    :supervisor.start_child(sup, worker(ListSubSupervisor, [list_data]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end

  #def init(list) do
    #child_process = [ worker(ListServer, list) ]
    #supervise child_process, strategy: :one_for_one
  #end



end