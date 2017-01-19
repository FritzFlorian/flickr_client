defmodule FlickrClient.Entity.PhotoResponse do
  @moduledoc"""
  Describes a response for getting a set of photos.
  """
  @derive [Poison.Encoder]
  defstruct [:photos]
end
