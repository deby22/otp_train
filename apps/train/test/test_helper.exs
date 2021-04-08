ExUnit.start()

Application.put_env(
  :train,
  :control_panel_api,
  Train.TrainManager.DummyControlPanelAPI
)
