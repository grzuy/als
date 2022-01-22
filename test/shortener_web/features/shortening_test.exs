defmodule ShortenerWeb.Features.ShorteningTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  import Wallaby.Query, only: [text_field: 1, button: 1]

  feature "visitor can shorten URL", %{session: session} do
    session
    |> visit("/")
    |> fill_in(text_field("URL"),
      with: "https://hexdocs.pm/phoenix/Phoenix.html"
    )
    |> click(button("Get shortened URL"))
    |> assert_text("Shortened URL: #{ShortenerWeb.Endpoint.url()}/")
  end
end
