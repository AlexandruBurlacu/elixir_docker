defmodule Users do
  def count do
    response = HTTPotion.get "http://jsonplaceholder.typicode.com/users"

    case Poison.Parser.parse(response.body) do
      {:ok, json} -> "I got #{length(json)} users!"
      _           -> "something wrong with the answer"
    end
  end
end

