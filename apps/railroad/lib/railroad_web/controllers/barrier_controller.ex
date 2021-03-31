defmodule RailroadWeb.BarrierController do
  use RailroadWeb, :controller

  alias Railroad.RailroadBarrier
  alias Railroad.RailroadBarrier.Barrier

  action_fallback RailroadWeb.FallbackController

  def index(conn, _params) do
    barriers = RailroadBarrier.list_barriers()
    render(conn, "index.json", barriers: barriers)
  end

  def show(conn, %{"name" => name}) do
    barrier = RailroadBarrier.get_barrier!(name)
    render(conn, "show.json", barrier: barrier)
  end

  def update(conn, %{"name" => name} = barrier_params) do
    barrier = RailroadBarrier.get_barrier(name)
    return_response(conn, barrier, barrier_params)
  end

  defp return_response(conn, nil, _) do
    conn
    |> put_status(409)
    |> put_view(RailroadWeb.ErrorView)
    |> render(:"404")
  end

  defp return_response(conn, barrier, barrier_params) do
    with {:ok, %Barrier{} = barrier} <- RailroadBarrier.update_barrier(barrier, barrier_params) do
      render(conn, "show.json", barrier: barrier)
    end
  end
end
