# FlickrClient

A very basic 'wrapper' around the flickr api.


Currently only photo search works, 
as this is only used for a small pet project of me.
Feel free to expand it or let me know if you need other functionality.


All other get functions can be implemented easily, api endpoints requiring
auth will not work (for that you will need a full oath implementation).

Usage:
```
# Get the results (contain pagination details)
result = FlickrClent.search(text "some term")

# Get an individual photo struct
photos = result.photo
photo = hd(photo)

# Read properties manually
photo.id
photo.owner

# Get an url to the image file
FlickrClient.Entity.Photo.url(photo, "jpg")
```

