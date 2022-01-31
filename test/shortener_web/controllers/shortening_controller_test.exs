defmodule ShortenerWeb.ShorteningControllerTest do
  use ShortenerWeb.ConnCase

  alias Shortener.{Repo, Shortening}

  describe "create" do
    test "missing url", %{conn: conn} do
      original_count = Repo.aggregate(Shortening, :count)

      conn =
        post(
          conn,
          Routes.shortening_path(conn, :create),
          shortening: %{url: ""}
        )

      assert get_flash(conn, :error) == "Link is invalid"
      assert redirected_to(conn) == "/"

      # No new shortening created
      assert Repo.aggregate(Shortening, :count) == original_count
    end

    test "invalid url", %{conn: conn} do
      original_count = Repo.aggregate(Shortening, :count)

      conn =
        post(
          conn,
          Routes.shortening_path(conn, :create),
          shortening: %{url: "https://incomplete"}
        )

      assert get_flash(conn, :error) == "Link is invalid"
      assert redirected_to(conn) == "/"

      # No new shortening created
      assert Repo.aggregate(Shortening, :count) == original_count
    end

    test "valid url", %{conn: conn} do
      original_count = Repo.aggregate(Shortening, :count)

      conn =
        post(
          conn,
          Routes.shortening_path(conn, :create),
          shortening: %{url: "https://valid.com"}
        )

      assert get_flash(conn, :error) == nil
      assert redirected_to(conn) == "/"

      # No new shortening created
      assert Repo.aggregate(Shortening, :count) == original_count + 1
    end
  end
end
