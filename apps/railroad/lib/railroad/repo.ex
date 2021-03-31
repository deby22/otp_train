defmodule Railroad.Repo do
  use Ecto.Repo,
    otp_app: :railroad,
    adapter: Ecto.Adapters.Postgres
end
