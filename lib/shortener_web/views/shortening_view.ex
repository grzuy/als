defmodule ShortenerWeb.ShorteningView do
  use ShortenerWeb, :view

  def shortened_url(shortening) do
    "#{ShortenerWeb.Endpoint.url()}/#{shortening.slug}"
  end
end
