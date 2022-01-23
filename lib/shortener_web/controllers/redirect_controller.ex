defmodule ShortenerWeb.RedirectController do
  use ShortenerWeb, :controller

  alias Shortener.{Repo, Shortening}

  def show(conn, %{"slug" => slug}) do
    shortening =
      Shortening
      |> Repo.get_by!(slug: slug)

    redirect(conn, external: shortening.target_url)
  end
end
