defmodule Train.TrainManager do
  alias Train.TrainManager.{Train, ControlPanelAPI}

  @moduledoc """
    Core layer to manage train action, and pass it to control panel
  """

  @spec change_speed(%Train{}) :: %Train{}
  @doc "Change speed and pass new speed to control panel"
  def change_speed(train) do
    train = Train.change_speed(train)
    control_panel().send_train_speed(train)
    train
  end

  @spec visit_station(%Train{}) :: %Train{}
  @doc "Check nearest station and send information to control panel"
  def visit_station(train) do
    train = Train.visit_station(train)
    control_panel().send_train_station(train)
    train
  end

  @spec init_train :: %Train{}
  @doc "Prepare new train"
  def init_train(), do: %Train{}

  defp control_panel() do
    Application.get_env(:train, :control_panel_api, ControlPanelAPI)
  end
end
