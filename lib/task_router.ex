defmodule ElixirDocker.Router.TasksRouter do
  use Plug.Router

  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Poison
  plug :dispatch

  defp common_behaviour(connection) do
    connection
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{data: "Nothing to show"}))
  end

  post "/" do
    common_behaviour(conn)
  end

  get "/" do
    common_behaviour(conn)
  end

  get "/:id" do
    common_behaviour(conn)
  end

  put "/:id" do
    common_behaviour(conn)
  end

  delete "/:id" do
    common_behaviour(conn)
  end
end