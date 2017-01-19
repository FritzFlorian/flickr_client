defmodule FlickrClient do
  @moduledoc"""
  A thin wrapper around the flick rest api.
  """
  alias FlickrClient.Entity.FailedRequest
  alias FlickrClient.Entity.PhotoResponse
  alias FlickrClient.Entity.PhotoCollection
  alias FlickrClient.Entity.Photo

  require Logger

  @doc"""
  Search for photos using the flickr api.

  Returns a `FlickrClient.Entity.PhotoCollection` struct.
  """
  def search_photos(text) do
    FlickrClient.FlickrEndpoint.get_method("flickr.photos.search", %{text: text}).body
    |> decode_to_struct!(%PhotoResponse{photos: %PhotoCollection{photo: [%Photo{}]}})
    |> Map.get(:photos)
  end


  defp decode_to_struct!(body, as_struct) do
    case Poison.decode(body, as: %FailedRequest{}) do
      {:ok, error = %{stat: "fail"}} ->
        Logger.error "Error With Flickr API Request! '#{error.message}'"
        raise FlickrClient.Error, message: error.message
      _ ->
        Poison.decode!(body, as: as_struct)
    end
  end
end

defmodule FlickrClient.Error do
  defexception message: "Flickr API Error!"
end
