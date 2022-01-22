defmodule ShortenerWeb.ShorteningController do
  use ShortenerWeb, :controller
  alias Shortener.{Repo, Shortening, Slugs}

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"shortening" => %{"url" => url}}) do
    shortening =
      %Shortening{slug: Slugs.new_slug(), target_url: url}
      |> Repo.insert!()

    redirect(conn, to: Routes.shortening_path(conn, :show, shortening))
  end

  def show(conn, %{"id" => id}) do
    shortening = Repo.get!(Shortening, id)
    render(conn, "show.html", shortening: shortening)
  end
end
