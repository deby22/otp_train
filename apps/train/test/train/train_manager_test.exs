defmodule Train.TrainManagerTest do
  alias Train.TrainManager
  use ExUnit.Case

  test "init train" do
    assert %TrainManager.Train{} == TrainManager.init_train()
  end

  test "change speed" do
    train = TrainManager.init_train()
    %TrainManager.Train{station: nil, speed: speed} = TrainManager.change_speed(train)
    assert Decimal.lt?(speed, 181)
    assert Decimal.gt?(speed, 0)
  end

  test "visit station" do
    train = TrainManager.init_train()
    %TrainManager.Train{station: station, speed: nil} = TrainManager.visit_station(train)
    refute station == nil
  end
end
