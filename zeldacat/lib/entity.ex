defmodule Entity do
  ### Public API
  def init do
    :gen_event.start_link()
  end

  def add_component(pid, component, args) do
    :gen_event.add_handler(pid, component, args)
  end
end