defmodule FlickrClientTest do
  use ExUnit.Case

  test "search photo by name" do
    photo_collection = FlickrClient.search(text: "sample search")

    assert photo_collection.page == 1
    assert photo_collection.pages == 100
    assert photo_collection.total == "500"

    photos = photo_collection.photo

    assert Enum.count(photos) == 1

    photo = hd(photos)

    assert photo.id == "1111"
    assert photo.owner == "2222"
    assert photo.secret == "3333"
    assert photo.server == "4444"
    assert photo.farm == 5555
    assert photo.title == "Some Title"
    assert photo.ispublic == 1
    assert photo.isfriend == 0
    assert photo.isfamily == 0
  end
end

defmodule FlickrMockEndpoint do
  @behaviour FlickrClient.Endpoint

  def get_method("flickr.photos.search", %{text: "sample search"}) do
    {:ok, result} = File.read "test/fixtures/flickr.photos.search.json"

    result
  end

  def get_method(_, _), do: "{}"
end

