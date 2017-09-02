defmodule RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  
  @opts ElixirDocker.Router.init([])
  
  test "returns 404" do
    conn = conn(:get, "/")
  
    conn = ElixirDocker.Router.call(conn, @opts)
  
    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == Poison.encode!(%{endpoint: "not implemented!"})
  end

  test "returns ok" do
    conn = conn(:get, "/status")
    
    conn = ElixirDocker.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body
  end
end