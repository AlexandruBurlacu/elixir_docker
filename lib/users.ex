defmodule Users do
  @moduledoc """
  Documentation for Users module.
  """

  @doc """
  Fetches 10 users from an URL
  """
  def count(url) do
    response = HTTPotion.get url

    case Poison.Parser.parse(response.body) do
      {:ok, json} -> "I got #{length(json)} users!"
      _           -> "something wrong with the answer"
    end
  end
end

