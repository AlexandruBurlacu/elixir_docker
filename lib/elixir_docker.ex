defmodule ElixirDocker do
  @moduledoc """
  Documentation for ElixirDocker.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirDocker.hello
      Entering...
      Exiting!
      :world

  """
  def hello do
    decorate_hello :world
  end

  defp decorate_hello(atom) do
    IO.puts "Entering..."
    IO.puts "Exiting!"
    atom
  end
end
