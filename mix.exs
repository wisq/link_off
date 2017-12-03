defmodule LinkOff.Mixfile do
  use Mix.Project

  def project do
    [
      app: :link_off,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {LinkOff, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},

      # Fix https://github.com/bitwalker/distillery/issues/321
      {:distillery, git: "https://github.com/bitwalker/distillery.git",
        ref: "4c154e013a27d9f82d8cff147309674eb41e3db4", runtime: false},
    ]
  end
end
