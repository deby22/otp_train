defmodule ControlPanelTest do
  use ExUnit.Case
  doctest ControlPanel

  test "greets the world" do
    assert ControlPanel.hello() == :world
  end
end
