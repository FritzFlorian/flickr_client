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
  Method:     flickr.photos.search
  API-Doc:    https://www.flickr.com/services/api/flickr.photos.search.html

  Search for photos using the flickr api.
  Pass options to search for specific images.

  Returns `FlickrClient.Entity.PhotoCollection`.

  ## Examples

    iex> FlickrClient.search(text: "sample search")
    %FlickrClient.Entity.PhotoCollection{}

  """
  def search(options \\ []) do
    endpoint.get_method("flickr.photos.search", keywordlist_to_map(options))
    |> decode_to_struct!(%PhotoResponse{photos: %PhotoCollection{photo: [%Photo{}]}})
    |> Map.get(:photos)
  end

  defp keywordlist_to_map(options), do: Enum.into(options, %{})

  defp decode_to_struct!(body, as_struct) do
    case Poison.decode(body, as: %FailedRequest{}) do
      {:ok, error = %{stat: "fail"}} ->
        Logger.error "Error With Flickr API Request! '#{error.message}'"
        raise FlickrClient.Error, message: error.message
      _ ->
        Poison.decode!(body, as: as_struct)
    end
  end

  defp endpoint do
    Application.get_env(:flickr_client, :flickr_endpoint) || FlickrClient.FlickrHttpEndpoint
  end
end
