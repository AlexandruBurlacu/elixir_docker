defmodule ElixirDocker.PlugExample do
  @moduledoc """
  Documentation for PlugExample of ElixirDocker.
  """
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, "<h1> Hello World <h1/>")
  end
end
