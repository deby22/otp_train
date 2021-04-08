use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :railroad,
  api_url: "http://localhost:4000/api/v2"

import_config "#{Mix.env()}.exs"
