defmodule ControlPanel.ControlPanelTest do
  use ExUnit.Case
  alias ControlPanel.ControlPanel

  test "change_train_speed" do
    assert ControlPanel.change_train_speed(Decimal.new("10")) == :slow
    assert ControlPanel.change_train_speed(Decimal.new("40")) == :slow
    assert ControlPanel.change_train_speed(Decimal.new("40.1")) == :normal
    assert ControlPanel.change_train_speed(Decimal.new("60")) == :normal
    assert ControlPanel.change_train_speed(Decimal.new("140")) == :normal
    assert ControlPanel.change_train_speed(Decimal.new("140.1")) == :fast
    assert ControlPanel.change_train_speed(Decimal.new("160")) == :fast
    assert ControlPanel.change_train_speed(Decimal.new("180")) == :fast
  end

  test "visit with valid station with OPEN barrier" do
    assert {:ok, "CLOSED"} == ControlPanel.visit_station("valid OPEN")
  end

  test "visit with valid station with CLOSED barrier" do
    station = "valid CLOSED"
    msg = "[anomalia] Barrier '#{station}' should be opened"
    assert {:error, msg} == ControlPanel.visit_station(station)
  end

  test "visit invalid station" do
    assert {:error, "Unknown station: 'invalid'"} == ControlPanel.visit_station("invalid")
  end

  test "open valid barrier on valid station" do
    station = "valid CLOSED"
    assert {:ok, "OPEN"} == ControlPanel.open_barrier(station)
  end
end
