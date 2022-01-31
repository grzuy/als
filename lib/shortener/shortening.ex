defmodule Shortener.Shortening do
  use Ecto.Schema
  import Ecto.Changeset

  # Very naive and simplified format
  # Could use improevement
  @url_format_regex ~r/\Ahttps?:\/\/.+\..+\z/

  schema "shortenings" do
    field :slug, :string
    field :target_url, :string

    timestamps()
  end

  @doc false
  def changeset(shortening, attrs) do
    shortening
    |> cast(attrs, [:slug, :target_url])
    |> validate_required([:slug, :target_url])
    |> validate_format(:target_url, @url_format_regex)
  end
end
