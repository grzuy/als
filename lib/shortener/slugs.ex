# TODO: Better algorithm to generate slugs.
#
# General properties to consider about the slug generation algorithm:
#   - Collision avoidance
#   - URL enumeration resistance
#   - Concurrency
#   - Consistency
#   - Change in the performance of the algorithm as free slug count
#     decreases with time
#   - Accidental profanity in slugs
#
# Possible options:
#
#  A. Base62 encoding of shortenings.id for collision-avoidance plus a
#     two digit checksum to avoid enumeration shortened URLs
#  B. Have a process (or many with load balancing) be responsible for
#     producing unique/random/unused slugs to avoid collisions. Could
#     have a large number preemptively produced stored in a cache ready
#     to be consumed to improve performance.
defmodule Shortener.Slugs do
  @slug_length 6
  @slug_alphabet Enum.concat([?0..?9, ?A..?Z, ?a..?z])

  def new_slug() do
    # Simple but naive implementation. Possible collisions.
    Enum.map(
      1..@slug_length,
      fn _ -> Enum.random(@slug_alphabet) end
    )
    |> List.to_string()
  end
end
