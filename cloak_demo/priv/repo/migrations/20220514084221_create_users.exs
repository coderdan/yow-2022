defmodule CloakDemo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :binary
      add :first_name, :binary
      add :first_name_hash, :binary
      add :dob, :binary
      add :medicare, :binary
      add :medicare_hash, :binary
    end
  end
end
