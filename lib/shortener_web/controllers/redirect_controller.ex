defmodule ShortenerWeb.RedirectController do
  use ShortenerWeb, :controller

  alias Shortener.{Repo, Shortening}

  def show(conn, %{"slug" => slug}) do
    Shortening
    |> Repo.get_by(slug: slug)
    |> case do
      nil ->
        put_status(conn, :not_found)
        |> html("")

      shortening ->
        redirect(conn, external: shortening.target_url)
    end
  end
end
