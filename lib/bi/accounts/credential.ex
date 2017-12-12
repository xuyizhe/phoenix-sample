defmodule Bi.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bi.Accounts.{Credential, User}


  schema "credentials" do
    field :email, :string
    # field :user_id, :id
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Credential{} = credential, attrs) do
    credential
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
