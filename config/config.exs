# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logger,
  level: :info

case Mix.env do
  :test ->
    config :flickr_client,
      flickr_key: "FLICKR_KEY"

  :dev ->
    config :flickr_client,
      flickr_key: "FLICKR_KEY"

  _ -> true
end
