ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Shortener.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, ShortenerWeb.Endpoint.url())

defmodule TestHelper do
  def shorten(url) do
    slug = Shortener.Slugs.new_slug()
    Shortener.Repo.insert!(%Shortener.Shortening{slug: slug, target_url: url})
    slug
  end
end
