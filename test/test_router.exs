defmodule RouterTest do
  use ExUnit.Case, async: false
  use ExCheck
  use Plug.Test
  
  @opts ElixirDocker.Router.init([])
  
  property :returns_404 do
    for_all _ in int() do
      conn = conn(:get, "/")
  
      conn = ElixirDocker.Router.call(conn, @opts)
  
      assert conn.state == :sent
      assert conn.status == 404
      assert conn.resp_body == Poison.encode!(%{endpoint: "not implemented!"})
    end
  end

  property :returns_ok do
    for_all _ in int() do
      conn = conn(:get, "/status")
    
      conn = ElixirDocker.Router.call(conn, @opts)

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body =~ ~r/{"result_count":[0-9]*,"last_run":"[0-9-]*T[0-9:]*"}/i
    end
  end
end