defmodule Users do
  @moduledoc """
  Documentation for Users module.
  """

  @doc """
  Fetches 10 users from an URL
  """
  alias ElixirDocker.Repo
  alias ElixirDocker.Record

  def count(url) do
    response = HTTPotion.get url

    case Poison.Parser.parse(response.body) do
      {:ok, json} -> Repo.insert! %Record{count: length(json)}
      _           -> IO.puts "something wrong with the answer"
    end
  end
end
