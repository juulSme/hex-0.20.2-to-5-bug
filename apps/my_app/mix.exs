defmodule MyApp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :my_app,
      version: "1.1.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "1.8.1",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :acc || Mix.env() == :staging || Mix.env() == :prod,
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
      mod: {MyApp.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :ueberauth,
        :hackney,
        :arc_ecto,
        :ex_aws,
        :ex_phone_number,
        :pdf_generator
      ]
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
      {:arc_ecto, "~> 0.11"},
      {:arc, "~> 0.11"},
      {:argon2_elixir, "~> 2.0"},
      {:comeonin, "~> 5.1"},
      {:csv, "~> 2.0"},
      {:ecto_autoslug_field, "~> 1.0"},
      {:ecto, "~> 3.0.9"},
      {:elixir_uuid, "~> 1.2"},
      {:ex_aws_s3, "~> 2.0"},
      {:ex_aws_ses, "~> 2.0"},
      {:ex_aws_sns, "~> 2.0"},
      {:ex_aws, "~> 2.0", override: true},
      {:ex_phone_number, "~> 0.1"},
      {:gettext, "~> 0.14"},
      {:guardian_db, "~> 2.0"},
      {:guardian, "~> 1.2"},
      {:hackney, "~> 1.9"},
      {:hashids, "~> 2.0"},
      {:httpoison, "~> 1.5"},
      {:jason, "~> 1.1"},
      {:pdf_generator, ">=0.5.5"},
      {:poison, ">= 1.2.0"},
      {:postgrex, "~> 0.14"},
      {:quantum, "~> 2.3"},
      {:stripity_stripe, "~> 2.4"},
      {:sweet_xml, "~> 0.6"},
      {:timex, "~> 3.4"},
      {:trans, "~> 2.0"},
      {:ueberauth_identity, "~> 0.2"},
      {:ueberauth, "~> 0.5"},
      {:word_smith, "~> 0.1.0"},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
