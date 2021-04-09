# OtpTrain

## Description

Application to simulate Train visiting Station and inform ControlPanel about changespeed and nearest station

## Important

This is Umbrella project to aggregate 3 microservices

* "train"
  * after every 10 seconds - change speed and send information to "control_panel"
  * after every 180 seconds - check nearest station and send information to "control_panel"
* "control_panel" - get information from "train", save them as logs in "data.log" and communicate with railroad_barrier on change barrier status
    * Logged information
        * [ speed ] 0.0-40.: slow
        * [ speed ] - 40.0-140.0 - normal
        * [ speed ] - 140.0 - 180.0 - fast
        * [visit station] - station name
        * [ anomalia ] - when station is closed, when it should be oppened
        * [open barrier] - after 10 seconds on arriving

* "railroad_barrier" - HTTP API interface, to manage barrier status. Allowed operation
    *  [GET] /api/v1/barrier/[station name] - get information about current barrier status
    * [POST] /api/v1/barrier - change barrier status (allowed OPEN/CLOSED)

## Logging

* All information are logged into console
* Only control_panel information are logged to file 

## Usage
 
 There is 2 way to run application.

### Run as umbrella

Simple run all application with one command

Open iex terminal

```bash
mix phx.server
```

### Run application as standalone services

Open iex terminal

```bash
# run train and control panel application
cd apps/train/
iex -S mix

# run railroad barrier
cd apps/railroad/
mix phx.server
```




