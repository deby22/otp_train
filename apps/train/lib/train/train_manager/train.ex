defmodule Train.TrainManager.Train do
  alias Decimal, as: D
  @speed_range 0..1800
  @stations Application.compile_env(:train, :stations, [])
  defstruct [:station, :speed]

  @moduledoc """
    Core logic of train
  """

  @doc "Select random speed from range 0-180"
  @spec change_speed(%__MODULE__{}, fun()) :: %__MODULE__{}
  def change_speed(train, rand_fun \\ &Enum.random/1) do
    speed =
      @speed_range
      |> rand_fun.()
      |> D.div(10)

    %__MODULE__{train | speed: speed}
  end

  @doc "Remember nearest station to arriving"
  @spec visit_station(%__MODULE__{}, fun()) :: %__MODULE__{}
  def visit_station(train, rand_fun \\ &Enum.random/1) do
    station = rand_fun.(@stations)
    %__MODULE__{train | station: station}
  end
end
