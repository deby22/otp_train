defmodule Train.Application do
  use Application
  @moduledoc false

  @impl true
  def start(_type, _args) do
    children = [Train.Server]
    opts = [strategy: :one_for_one, name: Train.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
