defmodule FlickrClient.Entity.PhotoCollection do
  @moduledoc"""
  Describes a colection of photos delivered by the flickr api.
  Contains information on pagination.
  Photos are accessed as `photo`.
  """
  @derive [Poison.Encoder]
  defstruct [:page, :pages, :perpage, :photo, :total]
end
