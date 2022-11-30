defmodule ADogcion.Repo.Migrations.CreateAnimals do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :string
      add :species, :string
      add :breed, :string
      add :size, :string
      add :age, :integer
      add :description, :text
      add :special_needs, :text
      add :health_information, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:animals, [:user_id])
  end
end
