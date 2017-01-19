# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logger,
  level: :info

case Mix.env do
  :test ->
    cofig :flickr_client,
      flickr_token: "FLICKR_TOKEN"

  :dev ->
    config :flickr_client,
      flickr_token: "FLICKR_TOKEN"

  _ -> true
end
