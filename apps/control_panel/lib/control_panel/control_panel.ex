defmodule ControlPanel.ControlPanel do
  require Logger
  alias ControlPanel.BarrierAPI

  def change_train_speed(speed) do
    metadata = metadata_for_speed(speed)
    Logger.info("Current train speed: #{speed}", speed: metadata)
  end

  defp metadata_for_speed(speed) do
    cond do
      speed <= 40 -> :slow
      speed <= 140 -> :normal
      true -> :fast
    end
  end

  def visit_station(station) do
    Logger.info("The train is approaching the station", station: station)

    case BarrierAPI.current_barrier_status(station) do
      {:ok, "OPEN"} -> BarrierAPI.close_barrier(station)
      {:ok, "CLOSED"} -> Logger.info("anomalia")
      {:error, error} -> Logger.error(error)
    end
  end

  def open_barrier(station) do
    Logger.info("RailRoad Barrier on station: #{station} is opened")
  end
end
