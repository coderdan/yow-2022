defmodule CloakDemo.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, CloakDemo.Encrypted.Binary
    field :first_name, CloakDemo.Encrypted.Binary
    field :first_name_hash, Cloak.Ecto.SHA256
    field :dob, CloakDemo.Encrypted.Binary
    field :medicare, CloakDemo.Encrypted.Binary
    field :medicare_hash, Cloak.Ecto.SHA256
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:email, :first_name, :medicare, :dob])
    |> put_hashed_fields()
  end

  defp put_hashed_fields(changeset) do
    changeset
    |> put_change(:first_name_hash, get_field(changeset, :first_name))
    |> put_change(:medicare_hash, get_field(changeset, :medicare))
  end
end
