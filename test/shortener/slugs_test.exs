defmodule Shortener.SlugsTest do
  use Shortener.DataCase

  alias Shortener.Slugs

  test "new_slug/0 generates random slugs" do
    assert Slugs.new_slug() != Slugs.new_slug()
  end
end
