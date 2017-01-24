defmodule FlickrClient.Error do
  @moduledoc"""
  Raised when there is an error during a API request.
  """
  defexception message: "Flickr API Error!"
end
