defmodule ControlPanel.Server do
  use GenServer
  alias ControlPanel.ControlPanel
  require Logger
  @closed_delay 5_000

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_cast({:change_speed, speed}, nil) do
    metadata = ControlPanel.change_train_speed(speed)
    # metadata speed
    Logger.info("Current train speed: #{speed}", speed: metadata)
    {:noreply, nil}
  end

  def handle_cast({:visit_station, station}, nil) do
    # metadata nazwa stacji
    Logger.info("The train is approaching the station #{station}", station: station)

    with {:error, msg} <- ControlPanel.visit_station(station) do
      Logger.error(msg)
    end

    Process.send_after(self(), {:open_barrier, station}, @closed_delay)
    {:noreply, nil}
  end

  def handle_info({:open_barrier, station}, _) do
    Logger.info("Open barrier on station #{station}")

    with {:error, msg} <- ControlPanel.open_barrier(station) do
      Logger.error(msg)
    end

    {:noreply, nil}
  end
end
