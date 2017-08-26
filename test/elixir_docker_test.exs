defmodule ElixirDockerTest do
  use ExUnit.Case
  doctest ElixirDocker

  test "greets the world" do
    assert ElixirDocker.hello() == "Hello World"
  end
end
