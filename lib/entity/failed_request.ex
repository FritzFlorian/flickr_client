defmodule FlickrClient.Entity.FailedRequest do
  @moduledoc"""
  A failed request. Used for error handling.
  """
  @derive [Poison.Encoder]
  defstruct [:stat, :code, :message]
end
