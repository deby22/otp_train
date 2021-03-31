# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Railroad.Repo.insert!(%Railroad.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
stations = Application.get_env(:train, :stations)
Railroad.Repo.delete_all(Railroad.RailroadBarrier.Barrier)

for station <- stations do
  Railroad.RailroadBarrier.create_barrier(%{name: station, status: "CLOSED"}) |> IO.inspect()
end
