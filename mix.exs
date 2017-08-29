defmodule ElixirDocker.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_docker,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      test_coverage: [tool: ExCoveralls],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ElixirDocker, []},
      extra_applications: [:logger, :httpotion, :postgrex, :ecto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.1.2"},
      {:plug, "~> 1.3.4"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.0.0-beta"},
      {:httpotion, "~> 2.1.0"},
      {:poison, "~> 1.5"},
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.2"},
      # for dev and test purpose only
      {:excoveralls, github: "parroty/excoveralls", only: :test},
      {:credo, "~> 0.3.0", only: [:test, :dev]},
      {:excheck, "~> 0.5", only: :test},
      {:triq, github: "triqng/triq", only: :test}
    ]
  end
end
