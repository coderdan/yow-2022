defmodule CloakDemo.Repo do
  use Ecto.Repo,
    otp_app: :cloak_demo,
    adapter: Ecto.Adapters.Postgres
end
