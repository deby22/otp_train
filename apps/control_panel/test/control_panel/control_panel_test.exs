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
end
