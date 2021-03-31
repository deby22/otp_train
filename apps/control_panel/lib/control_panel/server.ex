defmodule ControlPanel.Server do
  use GenServer
  alias ControlPanel.ControlPanel
  @closed_delay 1_000

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_info(:change_speed, speed) do
    ControlPanel.change_train_speed(speed)
    {:noreply, nil}
  end

  def handle_info(:visit_station, station) do
    ControlPanel.visit_station(station)
    Process.send_after(self(), {:open_barrier, station}, @closed_delay)
    {:noreply, nil}
  end

  def handle_info({:open_barrier, station}, _) do
    ControlPanel.open_barrier(station)
    {:noreply, nil}
  end
end
