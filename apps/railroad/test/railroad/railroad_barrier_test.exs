defmodule Railroad.RailroadBarrierTest do
  use Railroad.DataCase

  alias Railroad.RailroadBarrier

  describe "barriers" do
    alias Railroad.RailroadBarrier.Barrier

    @valid_attrs %{name: "some name", status: "OPEN"}
    @update_attrs %{name: "some updated name", status: "CLOSED"}
    @invalid_attrs %{name: nil, status: nil}

    def barrier_fixture(attrs \\ %{}) do
      {:ok, barrier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RailroadBarrier.create_barrier()

      barrier
    end

    test "list_barriers/0 returns all barriers" do
      barrier = barrier_fixture()
      assert RailroadBarrier.list_barriers() == [barrier]
    end

    test "get_barrier/1 returns the barrier with given name" do
      barrier = barrier_fixture()
      assert RailroadBarrier.get_barrier(barrier.name) == barrier
    end

    test "create_barrier/1 with valid data creates a barrier" do
      assert {:ok, %Barrier{} = barrier} = RailroadBarrier.create_barrier(@valid_attrs)
      assert barrier.name == "some name"
      assert barrier.status == "OPEN"
    end

    test "create_barrier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RailroadBarrier.create_barrier(@invalid_attrs)
    end

    test "update_barrier/2 with valid data updates the barrier" do
      barrier = barrier_fixture()
      assert {:ok, %Barrier{} = barrier} = RailroadBarrier.update_barrier(barrier, @update_attrs)
      assert barrier.name == "some updated name"
      assert barrier.status == "CLOSED"
    end

    test "update_barrier/2 with invalid data returns error changeset" do
      barrier = barrier_fixture()
      assert {:error, %Ecto.Changeset{}} = RailroadBarrier.update_barrier(barrier, @invalid_attrs)
      assert barrier == RailroadBarrier.get_barrier(barrier.name)
    end
  end
end
