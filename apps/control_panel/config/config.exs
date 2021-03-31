use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :railroad_barrier,
  api_url: "http://localhost:4000/api/v2"
