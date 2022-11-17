defmodule ADogcion.Adopcion.Animal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    belongs_to :user,ADogcion.Accounts.User
    field :age, :integer
    field :breed, :string
    field :description, :string
    field :health_information, :string
    field :name, :string
    field :size, :string
    field :special_needs, :string
    field :species, :string

    timestamps()
  end

  @doc false
  def changeset(animal, attrs) do
    animal
    |> cast(attrs, [:name, :species, :breed, :size, :age, :description, :special_needs, :health_information])
    |> validate_required([:name, :species, :breed, :size, :age, :description, :special_needs, :health_information])
  end
end
