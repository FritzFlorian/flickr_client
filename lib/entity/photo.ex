defmodule FlickrClient.Entity.Photo do
  @moduledoc"""
  Describes a photo object as delivered by the flickr api.
  """
  @derive [Poison.Encoder]
  defstruct [:id, :owner, :secret, :server, :title, :ispublic, :isfriend, :isfamily, :farm]
end
