defmodule Railroad.RailroadBarrier.Barrier do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
    Barrier schema contains name and status
    Status could be just OPEN or CLOSED
  """

  schema "barriers" do
    field :name, :string
    field :status, :string

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(barrier, attrs) do
    barrier
    |> cast(attrs, [:name, :status])
    |> validate_required([:name, :status])
    |> unique_constraint(:name)
    |> validate_inclusion(:status, ~w"OPEN CLOSED")
  end
end
