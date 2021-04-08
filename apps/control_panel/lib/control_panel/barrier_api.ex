defmodule ControlPanel.BarrierAPI do
  use Tesla

  @moduledoc """
  API to communicate with Railroad API

  # get /barrier/<name> to check current status
  # post /barrier/ %{name: name, status: status} to open or close barrier
  """

  @api_url Application.compile_env(:railroad, :api_url)

  plug(Tesla.Middleware.BaseUrl, @api_url)
  plug(Tesla.Middleware.Headers, [{"accept", "application/json"}])
  plug(Tesla.Middleware.JSON)
  # There is also option to add Fuse as Circuit Breaker

  def current_barrier_status(station), do: get_current_station_status(station)
  def close_barrier(station), do: open_or_close_barrier(station, "CLOSED")
  def open_barrier(station), do: open_or_close_barrier(station, "OPEN")

  defp get_current_station_status(station) do
    case get("/barrier/#{station}") do
      {:ok, %{status: 404}} -> {:error, "Unknown station: '#{station}'"}
      {:ok, response} -> {:ok, response.body["status"]}
      {:error, _} -> {:error, "Barrier is not available"}
    end
  end

  defp open_or_close_barrier(station, status) do
    case post("/barrier/", %{name: station, status: status}) do
      {:ok, %{status: 409}} -> {:error, "Unknown station: '#{station}'"}
      {:ok, %{status: 200} = response} -> {:ok, response.body["status"]}
      _ -> {:error, "Barrier is not available"}
    end
  end
end
