defmodule UserTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "count users" do
    assert is_map Users.count("http://jsonplaceholder.typicode.com/users")
  end

  test "wrong url" do
    assert capture_io(fn -> Users.count("http://jsonplaceholder.typicode.com")
    end) == "something wrong with the answer\n"
  end
end
