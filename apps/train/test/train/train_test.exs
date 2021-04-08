defmodule Train.TrainTest do
  alias Train.TrainManager.Train
  use ExUnit.Case

  test "change speed" do
    train =
      %Train{}
      |> Train.change_speed(fn _ -> 10 end)

    assert Decimal.new(1) == train.speed
  end

  test "visit station" do
    train =
      %Train{}
      |> Train.visit_station(fn stations -> List.first(stations) end)

    # Andoria is first station from config
    assert train.station == "Andoria"
  end
end
