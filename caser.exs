defmodule Users do 
  dave = %{ name: "Dave", state: "TX", likes: "programming" }
  
  case dave do
    %{state: some_state} = dave ->
      IO.puts "#{dave.name} lives in #{some_state}"
    _ = _ = _ ->
      IO.puts "No matches"
  end
end