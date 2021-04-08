defmodule Train.TrainManager do
  alias Train.TrainManager.{Train, ControlPanelAPI}

  def change_speed(train) do
    train = Train.change_speed(train)
    control_panel().send_train_speed(train)
    train
  end

  def visit_station(train) do
    train = Train.visit_station(train)
    control_panel().send_train_station(train)
    train
  end

  def init_train(), do: %Train{}

  defp control_panel() do
    Application.get_env(:train, :control_panel_api, ControlPanelAPI)
  end
end
