use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :railroad,
  api_url: "http://localhost:4000/api/v2"

config :logger,
  backends: [
    :console,
    # {LoggerFileBackend, :default_log},
    {LoggerFileBackend, :panel_log}
  ]

# config :logger, :default_log,
#   path: "data.log",
#   format: "$time [$metadata] $message\n",
#   metadata: [:speed, :station]

config :logger, :panel_log,
  path: "data.log",
  format: "$time [$level] [$metadata] $message\n",
  metadata: [:speed, :station],
  metadata_filter: [application: :control_panel]

import_config "#{Mix.env()}.exs"
