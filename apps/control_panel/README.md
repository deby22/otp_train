# ControlPanel

  OTP Server to communicate train and railroad barrier
  Save every change on train speed or visit new station
  Control Panel open barrier after 10 seconds on visiting train

# Important

This is a server-side application.
There is no user interface

# Logging

* All busines information are logged as info in data.log
* Anomalia like closed barrier is are logged in data.log
* Errors, like invalid response from API are logged as errors in errors.log


## Usage

Open iex terminal

```bash
iex -S mix
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `control_panel` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:control_panel, "~> 0.1.0"}
  ]
end
```

