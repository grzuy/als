defmodule ShortenerWeb.RedirectControllerTest do
  use ShortenerWeb.ConnCase

  test "GET /:slug", %{conn: conn} do
    slug = TestHelper.shorten("https://hexdocs.pm/phoenix/Phoenix.html")

    conn = get(conn, "/#{slug}")
    assert redirected_to(conn) == "https://hexdocs.pm/phoenix/Phoenix.html"
  end

  test "GET /:slug with invalid", %{conn: conn} do
    slug = TestHelper.shorten("https://hexdocs.pm/phoenix/Phoenix.html")

    conn = get(conn, "/#{slug}-wrong")

    assert response(conn, 404) == ""
  end
end
