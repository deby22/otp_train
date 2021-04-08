defmodule Train.Server do
  use GenServer
  alias Train.TrainManager

  @moduledoc """
    Server to simulate train.

    Implement two main functionality:
      * change speed of train
      * inform visiting station about arriving
  """

  @speed_interval 10_000
  @station_interval 180_000
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def change_speed_periodically() do
    Process.send_after(self(), :change_speed, @speed_interval)
  end

  def visit_station_periodically() do
    Process.send_after(self(), :visit_station, @station_interval)
  end

  def init(_) do
    change_speed_periodically()
    visit_station_periodically()
    {:ok, TrainManager.init_train()}
  end

  def handle_info(:change_speed, train) do
    change_speed_periodically()
    train = TrainManager.change_speed(train)
    {:noreply, train}
  end

  def handle_info(:visit_station, train) do
    visit_station_periodically()
    train = TrainManager.visit_station(train)
    {:noreply, train}
  end
end
