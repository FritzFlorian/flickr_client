# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logger,
  level: :info

case Mix.env do
  :test ->
    config :flickr_client,
      flickr_key: "FLICKR_KEY",
      flickr_endpoint: FlickrMockEndpoint

  :dev ->
    config :flickr_client,
      flickr_key: System.get_env("FLICKR_KEY") || "FLICKR_KEY_UNSET",
      flickr_endpoint: FlickrClient.FlickrHttpEndpoint

  _ -> true
end
