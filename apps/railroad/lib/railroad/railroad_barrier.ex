defmodule Railroad.RailroadBarrier do
  @moduledoc """
  The RailroadBarrier context.
  """

  import Ecto.Query, warn: false
  alias Railroad.Repo

  alias Railroad.RailroadBarrier.Barrier

  @doc """
  Returns the list of barriers.

  ## Examples

      iex> list_barriers()
      [%Barrier{}, ...]

  """
  def list_barriers do
    Repo.all(Barrier)
  end

  @doc """
  Gets a single barrier.

  Raises `Ecto.NoResultsError` if the Barrier does not exist.

  ## Examples

      iex> get_barrier!(123)
      %Barrier{}

      iex> get_barrier!(456)
      ** (Ecto.NoResultsError)

  """
  def get_barrier!(name), do: Repo.get_by!(Barrier, name: name)
  def get_barrier(name), do: Repo.get_by(Barrier, name: name)

  @doc """
  Creates a barrier.

  ## Examples

      iex> create_barrier(%{field: value})
      {:ok, %Barrier{}}

      iex> create_barrier(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_barrier(attrs \\ %{}) do
    %Barrier{}
    |> Barrier.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a barrier.

  ## Examples

      iex> update_barrier(barrier, %{field: new_value})
      {:ok, %Barrier{}}

      iex> update_barrier(barrier, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_barrier(%Barrier{} = barrier, attrs) do
    barrier
    |> Barrier.changeset(attrs)
    |> Repo.update()
  end
end
