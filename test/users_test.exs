defmodule UserTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "is map" do
    assert is_map Users.count("http://jsonplaceholder.typicode.com/users")
  end

  test "count users" do
    assert [:count , :inserted_at, :updated_at, :id, :__meta__]
    |> Enum.all?(&(Map.has_key?(Users.count("http://jsonplaceholder.typicode.com/users"), &1)))
  end

  test "wrong url" do
    assert capture_io(fn -> Users.count("http://jsonplaceholder.typicode.com")
    end) == "something wrong with the answer\n"
  end
end
