ExUnit.start()

Application.put_env(
  :control_panel,
  :barrier_api,
  ControlPanel.DummyApi
)
