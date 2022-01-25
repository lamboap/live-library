defmodule LiveLibrary.Repo do
  use Ecto.Repo,
    otp_app: :live_library,
    adapter: Ecto.Adapters.Postgres
end
