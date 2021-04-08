defmodule ControlPanel.DummyApi do
  def current_barrier_status(station) do
    case station do
      "invalid" -> {:error, "Unknown station: '#{station}'"}
      "valid OPEN" -> {:ok, "OPEN"}
      "valid CLOSED" -> {:ok, "CLOSED"}
    end
  end

  def close_barrier(_station), do: {:ok, "CLOSED"}
  def open_barrier(_station), do: {:ok, "OPEN"}
end
