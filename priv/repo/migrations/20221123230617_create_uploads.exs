defmodule ADogcion.Repo.Migrations.CreateUploads do
  use Ecto.Migration

  def change do
    create table(:uploads) do
      add :filename, :string
      add :size, :bigint
      add :content_type, :string
      add :hash, :string

      timestamps()
    end
    create index(:uploads, [:hash])
  end
end
