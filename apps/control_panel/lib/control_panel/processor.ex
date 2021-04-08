defmodule ControlPanel.Processor do
  alias ControlPanel.ControlPanel
  require Logger

  @moduledoc """
    Processor logs every train change speed and every visit to station
  """

  def log_actual_speed(speed) do
    metadata = ControlPanel.change_train_speed(speed)
    # metadata speed
    Logger.info("Current train speed: #{speed}", speed: metadata)
  end

  def log_train_station(station) do
    # metadata nazwa stacji
    Logger.info("The train is approaching the station #{station}", station: station)

    with {:error, msg} <- ControlPanel.visit_station(station) do
      Logger.error(msg)
    end
  end

  def open_barrier(station) do
    Logger.info("Open barrier on station #{station}")

    with {:error, msg} <- ControlPanel.open_barrier(station) do
      Logger.error(msg)
    end
  end
end
