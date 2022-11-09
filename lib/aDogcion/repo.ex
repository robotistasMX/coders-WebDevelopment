defmodule ADogcion.Repo do
  use Ecto.Repo,
    otp_app: :aDogcion,
    adapter: Ecto.Adapters.Postgres
end
