defmodule Train.TrainManager.DummyControlPanelAPI do
  @moduledoc false
  def send_train_speed(_train), do: :ok
  def send_train_station(_train), do: :ok
end
