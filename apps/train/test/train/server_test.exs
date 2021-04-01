defmodule TTrain.ServerTest do
  alias Train.{Train, Server}
  use ExUnit.Case, async: false
  @stations Application.get_env(:train, :stations, [])

  test "change speed" do
    Server.init([])
    pid = GenServer.whereis(Server)
    Kernel.send(pid, :change_speed)
    %Train{speed: speed} = :sys.get_state(pid) |> IO.inspect()
    assert speed != nil
  end

  test "visit station" do
    Server.init([])
    pid = GenServer.whereis(Server)
    Kernel.send(pid, :visit_station)
    %Train{station: station} = :sys.get_state(pid) |> IO.inspect()
    assert station in @stations
  end
end
