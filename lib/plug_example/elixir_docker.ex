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
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World")
  end
end