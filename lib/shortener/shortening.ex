defmodule Shortener.Shortening do
  use Ecto.Schema
  import Ecto.Changeset

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
  end

  def shortened_url(shortening) do
    "#{ShortenerWeb.Endpoint.url()}/#{shortening.slug}"
  end
end
