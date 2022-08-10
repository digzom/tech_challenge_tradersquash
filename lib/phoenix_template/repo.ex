defmodule PhoenixTemplate.Repo do
  use Ecto.Repo,
    otp_app: :insta_clone,
    adapter: Ecto.Adapters.Postgres
end
