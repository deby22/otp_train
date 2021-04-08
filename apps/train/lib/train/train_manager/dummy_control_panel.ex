defmodule Train.TrainManager.DummyControlPanelAPI do
  @moduledoc """
    Module to inform ControlPanel on change speed or arriving new station
  """

  def send_train_speed(_train), do: :ok
  def send_train_station(_train), do: :ok
end
