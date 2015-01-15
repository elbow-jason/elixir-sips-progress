defmodule ParallelMap do
  def pmap(collection, func) do
    me = self
    map_to_self = fn (elem) ->
          spawn_link fn -> (send me, { self, func.(elem) }) end
        end

    collect_result = fn (pid) -> 
      receive do { ^pid, result } -> result end
    end

    collection
    |>  Enum.map(map_to_self)
    |>  Enum.map(collect_result)
  end
end

defmodule ParallelStream do
  def pmap(collection, func) do
    me = self
    map_to_self = fn (elem) ->
          spawn_link fn -> (send me, { self, func.(elem) }) end
        end

    collect_result = fn (pid) -> 
      receive do { ^pid, result } -> result end
    end

    collection
    |>  Stream.map(map_to_self)
    |>  Enum.map(collect_result)
  end
end