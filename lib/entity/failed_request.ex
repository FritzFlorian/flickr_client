defmodule FlickrClient.Entity.FailedRequest do
  @moduledoc"""
  Entity describing a failed API request.

  It includes the error information associated with the response.
  """
  @derive [Poison.Encoder]
  defstruct [:stat, :code, :message]
end
