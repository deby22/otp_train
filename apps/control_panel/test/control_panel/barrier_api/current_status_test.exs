defmodule ControlPanel.BarrierAPI.CurrentStatusTest do
  use ExUnit.Case
  alias ControlPanel.BarrierAPI

  describe "api is available and return status - OPEN" do
    setup do
      mock_tesla("OPEN")
    end

    test "visit station " do
      assert {:ok, "OPEN"} == BarrierAPI.current_barrier_status("Alfred")
    end
  end

  describe "api is available and return status - CLOSED" do
    setup do
      mock_tesla("CLOSED")
    end

    test "visit station " do
      assert {:ok, "CLOSED"} == BarrierAPI.current_barrier_status("Alfred")
    end
  end

  describe "unknown station" do
    setup do
      mock_tesla("", 404)
    end

    test "visit station " do
      assert {:error, "Unknown station: 'Alfred'"} == BarrierAPI.current_barrier_status("Alfred")
    end
  end

  defp mock_tesla(status, status_code \\ 200) do
    Tesla.Mock.mock(fn
      %{method: :get} ->
        %Tesla.Env{status: status_code, body: %{"status" => status}}
    end)

    :ok
  end
end
