defmodule ShortenerWeb.ShorteningController do
  use ShortenerWeb, :controller
  alias Shortener.{Repo, Shortening, Slugs}
  import Ecto.Query, only: [from: 2]

  def new(conn, _params) do
    render(conn, "new.html", shortenings: Repo.all(from Shortening, order_by: [desc: :id]))
  end

  def create(conn, %{"shortening" => %{"url" => url}}) do
    %Shortening{slug: Slugs.new_slug(), target_url: url}
    |> Repo.insert!()

    redirect(conn, to: Routes.shortening_path(conn, :new))
  end
end
