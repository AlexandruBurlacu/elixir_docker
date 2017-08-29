defmodule UserTest do
  use ExUnit.Case

  test "count users" do
    assert Users.count("http://jsonplaceholder.typicode.com/users") == "I got 10 users!"
  end

  test "wrong url" do
    assert Users.count("http://jsonplaceholder.typicode.com") == "something wrong with the answer"
  end
end
