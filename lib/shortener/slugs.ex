defmodule Shortener.Slugs do
  @slug_length 6
  @slug_alphabet Enum.concat([?0..?9, ?A..?Z, ?a..?z])

  def new_slug() do
    # Naive implementation. Possible collisions.
    Enum.map(
      1..@slug_length,
      fn _ -> Enum.random(@slug_alphabet) end
    )
    |> List.to_string()
  end
end
