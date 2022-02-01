defmodule Shortener.Repo.Migrations.AddUniqueIndexToShortenigsSlug do
  use Ecto.Migration

  def change do
    create index("shortenings", :slug, unique: true)
  end
end
