defmodule EctoTest.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://sandbox:sandbox@localhost:5432/sandbox"
  end

  def priv do
    Application.app_dir(:ecto_test, "priv/repo")
  end

end