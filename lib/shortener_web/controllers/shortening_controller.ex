defmodule ShortenerWeb.ShorteningController do
  use ShortenerWeb, :controller
  alias Shortener.{Repo, Shortening, Slugs}

  def new(conn, _params) do
    render(conn, "new.html", shortenings: Repo.all(Shortening))
  end

  def create(conn, %{"shortening" => %{"url" => url}}) do
    shortening =
      %Shortening{slug: Slugs.new_slug(), target_url: url}
      |> Repo.insert!()

    redirect(conn, to: Routes.shortening_path(conn, :new))
  end
end
