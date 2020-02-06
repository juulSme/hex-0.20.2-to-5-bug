defmodule MyAppApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :my_app_api,
      version: "1.1.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "1.8.1",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :acc || Mix.env() == :staging || Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {MyAppApi.Application, []},
      extra_applications: [:logger, :runtime_tools, :timex, :oauth2]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.1", only: :dev},
      {:plug_cowboy, "~> 2.0"},
      {:gettext, "~> 0.14"},
      {:my_app, in_umbrella: true},
      {:cowboy, "~> 2.6"},
      {:timex, "~> 3.4"},
      {:httpoison, "~> 1.5"},
      {:eqrcode, "~> 0.1.6"},
      {:oauth2, "~> 0.9.4"},
      {:number, "~> 1.0.0"},
      {:file_info, "~> 0.0.4"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, we extend the test task to create and migrate the database.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      test: "cmd echo 'no tests to run'"
    ]
  end
end
