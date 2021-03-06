defmodule Train.TrainManager.ControlPanelAPI do
  @control_panel ControlPanel.Server

  @moduledoc """
    Module to inform ControlPanel on change speed or arriving new station
  """

  def send_train_speed(train) do
    GenServer.cast(@control_panel, {:actual_speed, train.speed})
  end

  def send_train_station(train) do
    GenServer.cast(@control_panel, {:train_station, train.station})
  end
end
