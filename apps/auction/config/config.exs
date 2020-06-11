use Mix.Config

config :auction, Auction.Repo,
  database: "auction_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"

config :auction, ecto_repos: [Auction.Repo]