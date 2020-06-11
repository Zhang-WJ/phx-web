# Since configuration is shared in umbrella projects, this file
# should only configure the :auction_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :auction_web,
  generators: [context_app: false]

# Configures the endpoint
config :auction_web, AuctionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KXXhcgbm41wVna1dhOX6K1zdGMirVaEAr3GCPBhUUHvLB58CfRCtyLy60HF1Fi7I",
  render_errors: [view: AuctionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuctionWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
