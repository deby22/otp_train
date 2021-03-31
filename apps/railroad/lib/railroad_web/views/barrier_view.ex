defmodule RailroadWeb.BarrierView do
  use RailroadWeb, :view
  alias RailroadWeb.BarrierView

  def render("index.json", %{barriers: barriers}) do
    %{data: render_many(barriers, BarrierView, "barrier.json")}
  end

  def render("show.json", %{barrier: barrier}) do
    %{status: barrier.status}
  end

  def render("barrier.json", %{barrier: barrier}) do
    %{id: barrier.id, name: barrier.name, status: barrier.status}
  end
end
