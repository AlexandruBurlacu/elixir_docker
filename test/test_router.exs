defmodule RouterTest do
  use ExUnit.Case, async: false
  use ExCheck
  use Plug.Test
  
  @opts ElixirDocker.Router.init([])

  property :returns_404 do
    for_all _ in int() do
      conn = conn(:get, "/whatever")
    
      conn = ElixirDocker.Router.call(conn, @opts)

      assert conn.state == :sent
      assert conn.status == 404
      assert conn.resp_body =~ ~r/{"endpoint":"not implemented!"}/i
    end
  end

  property :post_id_returns_404 do
    for_all id in int() do
      conn = conn(:post, "/v1/tasks/#{id}")
  
      conn = ElixirDocker.Router.call(conn, @opts)
  
      assert conn.state == :sent
      assert conn.status == 405
      assert conn.resp_body =~ ~r/{"info":"Impossible to update tasks via POST, use PUT instead"/i
    end
  end

  property :put_root_returns_404 do
    for_all _ in int() do
      conn = conn(:put, "/v1/tasks/")
  
      conn = ElixirDocker.Router.call(conn, @opts)
  
      assert conn.state == :sent
      assert conn.status == 405
      assert conn.resp_body =~ ~r/{"info":"Impossible to update all tasks"/i
    end
  end

  property :delete_root_returns_404 do
    for_all _ in int() do
      conn = conn(:delete, "/v1/tasks/")
  
      conn = ElixirDocker.Router.call(conn, @opts)
  
      assert conn.state == :sent
      assert conn.status == 405
      assert conn.resp_body =~ ~r/{"info":"Impossible to delete all tasks"/i
    end
  end
end
