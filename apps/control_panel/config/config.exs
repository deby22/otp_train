use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :railroad,
  api_url: "http://localhost:4000/api/v2"

config :logger,
  backends: [:console, {LoggerFileBackend, :error_log}]

config :logger, :error_log,
  path: "data.log",
  level: :debug,
  format: "$time [$metadata] $message\n",
  metadata: [:speed, :station]

import_config "#{Mix.env()}.exs"
