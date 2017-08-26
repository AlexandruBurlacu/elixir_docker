defmodule ElixirDocker do
  @moduledoc """
  Documentation for ElixirDocker.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirDocker.hello
      Hello World

  """
  use Application

  def hello do
    "Hello World"
  end

  def start(_type, _args) do
    Task.start(fn ->
      IO.puts hello
    end)
  end

end
