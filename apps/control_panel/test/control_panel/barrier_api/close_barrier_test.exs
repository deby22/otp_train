defmodule ControlPanel.BarrierAPI.CloseBarrierTest do
  use ExUnit.Case
  alias ControlPanel.BarrierAPI

  describe "unknown station" do
    setup do
      mock_tesla("", 409)
    end

    test "return erorr information when trying to close unknown station " do
      assert {:error, "Unknown station: 'Alfred'"} == BarrierAPI.close_barrier("Alfred")
    end
  end

  describe "valid station" do
    setup do
      mock_tesla("CLOSED", 200)
    end

    test "return information when barrier was close correctly" do
      assert {:ok, "CLOSED"} == BarrierAPI.close_barrier("Alfred")
    end
  end

  defp mock_tesla(status, status_code) do
    Tesla.Mock.mock(fn
      %{method: :post} ->
        %Tesla.Env{status: status_code, body: %{"status" => status}}
    end)

    :ok
  end
end
