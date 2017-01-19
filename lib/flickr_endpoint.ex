defmodule FlickrClient.FlickrEndpoint do
  @moduledoc """
  Module is a Endpoint to access the flickr api using HTTPotion.
  Ensures correct request format and parses the json response.
  """
  use HTTPotion.Base

  @doc """
  Used to issue a request to a specific api method.

  Parameters:

  - `method`: The API method identifier, e.g. 'flickr.photos.search'
  - `query`: A map holding the query parameters for the request
  """
  def get_method(method, query \\ %{}), do: get([method: method, query: query])

  @doc "Issues a get request to the flickr json rest API."
  def get(options \\ []), do: get("", options)

  @doc "Makes sure all requests have the correct base url"
  def process_url(url), do: "https://api.flickr.com/services/rest/" <> url

  @doc "Always request the correct json format. Allow to pass a method argument."
  def process_options(options) do
    new_query = (options[:query] || %{})
                |> Map.put(:format, "json")
                |> Map.put(:nojsoncallback, 1)
                |> Map.put(:api_key, api_key)
                |> Map.put(:method, options[:method] || options[:query][:method])

    Keyword.put(options, :query, new_query)
  end

  @doc "Always decode the response body's json.'"
  def process_response_body(body), do: Poison.decode!(body)

  defp api_key do
    Application.get_env(:flickr_client, :flickr_key)
  end
end
