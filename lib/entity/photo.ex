defmodule FlickrClient.Entity.Photo do
  @moduledoc"""
  Describes a photo object as delivered by the flickr api.
  """
  @derive [Poison.Encoder]
  defstruct [:id, :owner, :secret, :server, :title, :ispublic, :isfriend, :isfamily, :farm]

  def url(photo, format \\ "jpg") do
    "https://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg"
  end
end
