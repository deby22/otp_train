defmodule RailroadWeb.BarrierViewTest do
  use RailroadWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders index.json" do
    assert render(RailroadWeb.BarrierView, "index.json", %{barriers: []}) == %{data: []}
  end

  test "render show.json" do
    assert render(RailroadWeb.BarrierView, "show.json", %{
             barrier: %Railroad.RailroadBarrier.Barrier{status: "OPEN"}
           }) == %{status: "OPEN"}
  end

  test "render barrier.json" do
    {:ok, barrier} = Railroad.RailroadBarrier.create_barrier(%{name: "name", status: "OPEN"})

    assert render(RailroadWeb.BarrierView, "barrier.json", %{barrier: barrier}) ==
             %{id: barrier.id, name: barrier.name, status: barrier.status}
  end
end
