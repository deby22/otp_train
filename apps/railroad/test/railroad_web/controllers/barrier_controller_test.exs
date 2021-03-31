defmodule RailroadWeb.BarrierControllerTest do
  use RailroadWeb.ConnCase

  alias Railroad.RailroadBarrier
  alias Railroad.RailroadBarrier.Barrier

  @create_attrs %{
    name: "somename",
    status: "OPEN"
  }
  @update_attrs %{
    name: "somename",
    status: "CLOSED"
  }
  @invalid_attrs %{name: "somename", status: nil}
  @non_existing_barrier %{name: "non_existing", status: nil}

  def fixture(:barrier) do
    {:ok, barrier} = RailroadBarrier.create_barrier(@create_attrs)
    barrier
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all barriers", %{conn: conn} do
      conn = get(conn, Routes.barrier_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "update barrier" do
    setup [:create_barrier]

    test "renders barrier when data is valid", %{
      conn: conn,
      barrier: %Barrier{name: name}
    } do
      conn = post(conn, Routes.barrier_path(conn, :update), @update_attrs)
      conn = get(conn, Routes.barrier_path(conn, :show, name))
      assert %{"status" => "CLOSED"} = json_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.barrier_path(conn, :update), @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end

    test "renders errors when barrier does not exist", %{conn: conn} do
      conn = post(conn, Routes.barrier_path(conn, :update), @non_existing_barrier)
      assert %{"detail" => "Not Found"} == json_response(conn, 409)["errors"]
    end
  end

  defp create_barrier(_) do
    barrier = fixture(:barrier)
    %{barrier: barrier}
  end
end
