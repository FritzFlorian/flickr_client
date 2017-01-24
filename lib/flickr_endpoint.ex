defmodule FlickrClient.Endpoint do
  @doc """
  Returns the result body for a given get api method with optional parameters.

  Parameters:

  - method: The API method identifier, e.g. 'flickr.photos.search'
  - query: A map holding the query parameters for the request
  """
  @callback get_method(string, map) :: any
end
