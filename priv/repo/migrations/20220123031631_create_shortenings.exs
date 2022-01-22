defmodule Shortener.Repo.Migrations.CreateShortenings do
  use Ecto.Migration

  def change do
    create table(:shortenings) do
      add :slug, :string, null: false, size: 8
      add :target_url, :text, null: false

      timestamps()
    end
  end
end
