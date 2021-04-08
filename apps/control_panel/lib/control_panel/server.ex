defmodule ControlPanel.Server do
  use GenServer
  alias ControlPanel.Processor
  @closed_delay 10_000

  @moduledoc """
    OTP Server of ControlPanel.
    Get information on every train change and pass it to processor.
   After 10 seconds on arriving ControlPanel open last visited barrier
  """

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_cast({:actual_speed, speed}, nil) do
    Processor.log_actual_speed(speed)
    {:noreply, nil}
  end

  def handle_cast({:train_station, station}, nil) do
    # metadata nazwa stacji
    Processor.log_train_station(station)
    Process.send_after(self(), {:open_barrier, station}, @closed_delay)
    {:noreply, nil}
  end

  def handle_info({:open_barrier, station}, _) do
    Processor.open_barrier(station)
    {:noreply, nil}
  end
end
