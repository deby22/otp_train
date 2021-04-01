defmodule Train.ControlPanelAPI do
  @control_panel ControlPanel.Server
  def send_train_speed(train) do
    GenServer.cast(@control_panel, {:change_speed, train.speed})
  end

  def send_train_station(train) do
    GenServer.cast(@control_panel, {:visit_station, train.station})
  end
end
