.PHONY: $(MAKECMDGOALS)

setup:
	# Have proper Elixir/Erlang versions
	# Consider using -> asdf install
	mix deps.get
	mix ecto.setup
server:
	mix phx.server
test:
	mix format --check-formatted
	mix test
