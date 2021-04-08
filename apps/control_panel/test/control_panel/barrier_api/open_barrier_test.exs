defmodule ControlPanel.BarrierAPI.OpenBarrierTest do
  use ExUnit.Case
  alias ControlPanel.BarrierAPI

  describe "unknown station" do
    setup do
      mock_tesla("", 409)
    end

    test "return erorr information when trying to open unknown station " do
      assert {:error, "Unknown station: 'Alfred'"} == BarrierAPI.open_barrier("Alfred")
    end
  end

  describe "valid station" do
    setup do
      mock_tesla("OPEN", 200)
    end

    test "return information when barrier was opened correctly" do
      assert {:ok, "OPEN"} == BarrierAPI.open_barrier("Alfred")
    end
  end

  defp mock_tesla(status, status_code \\ 200) do
    Tesla.Mock.mock(fn
      %{method: :post} ->
        %Tesla.Env{status: status_code, body: %{"status" => status}}
    end)

    :ok
  end
end
