defmodule Train.Train do
  alias Decimal, as: D
  @speed_range 1..1800
  @stations Application.get_env(:train, :stations, [])

  defstruct [:station, :speed]

  def change_speed(train, rand_fun) do
    speed =
      @speed_range
      |> rand_fun.()
      |> D.div(10)

    %__MODULE__{train | speed: speed}
  end

  def visit_station(train, rand_fun) do
    station = rand_fun.(@stations)
    %__MODULE__{train | station: station}
  end
end
