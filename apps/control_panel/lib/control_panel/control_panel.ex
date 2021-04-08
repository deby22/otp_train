defmodule ControlPanel.ControlPanel do
  alias ControlPanel.BarrierAPI

  @moduledoc """
    Main logic of control panel
    Communicate with API and inform if all operations succed properly
  """
  def change_train_speed(speed) do
    cond do
      Decimal.lt?(speed, "40.1") -> :slow
      Decimal.lt?(speed, "140.1") -> :normal
      true -> :fast
    end
  end

  def visit_station(station) do
    case current_barrier_status(station) do
      {:ok, "OPEN"} -> opened_barrier(station)
      {:ok, "CLOSED"} -> closed_barrier(station)
      {:error, error} -> {:error, error}
    end
  end

  @spec open_barrier(any) :: {:error, <<_::64, _::_*8>>} | {:ok, any}
  def open_barrier(station) do
    barrier_api().open_barrier(station)
  end

  defp current_barrier_status(station) do
    barrier_api().current_barrier_status(station)
  end

  defp opened_barrier(station) do
    barrier_api().close_barrier(station)
  end

  defp closed_barrier(station) do
    {:error, "[anomalia] Barrier '#{station}' should be opened"}
  end

  defp barrier_api() do
    Application.get_env(:control_panel, :barrier_api, BarrierAPI)
  end
end
