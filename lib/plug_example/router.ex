defmodule ElixirDocker.Router do
  @moduledoc """
  Router for REST API endpoints...
  at least it will be as described.
  """

  use Plug.Router

  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Welcome")
  match _, do: send_resp(conn, 404, "Oops!")
end
