defmodule ShortenerWeb.Features.ShorteningTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  import Wallaby.Query, only: [text_field: 1, button: 1, link: 1]

  feature "visitor can shorten URL", %{session: session} do
    session
    |> visit("/")
    |> fill_in(text_field("Link"),
      with: "https://hexdocs.pm/phoenix/Phoenix.html"
    )
    |> click(button("Shorten"))
    |> assert_text("#{ShortenerWeb.Endpoint.url()}/")
    |> assert_has(link("https://hexdocs.pm/phoenix/Phoenix.html"))
    |> assert_text("Expands to https://hexdocs.pm/phoenix/Phoenix.html.")
  end
end
