defmodule Train.Server do
  use GenServer
  alias Train.Train

  @speed_interval 5_000
  @station_interval 10_000
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
    {:ok, %Train{}}
  end

  def handle_info(:change_speed, train) do
    change_speed_periodically()
    train = Train.change_speed(train, &Enum.random/1)
    {:noreply, train}
  end

  def handle_info(:visit_station, train) do
    visit_station_periodically()
    train = Train.visit_station(train, &Enum.random/1)
    {:noreply, train}
  end

  def handle_call(:train_info, _from, train) do
    {:reply, train, train}
  end

  def train_info(), do: GenServer.call(__MODULE__, :train_info)
end
