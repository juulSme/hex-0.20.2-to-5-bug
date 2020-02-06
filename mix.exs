defmodule MyApp.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "1.1.1",
      build_embedded: Mix.env() == :acc || Mix.env() == :staging || Mix.env() == :prod,
      start_permanent: Mix.env() == :acc || Mix.env() == :staging || Mix.env() == :prod,
      deps: deps(),
      # Docs
      name: "MyAppApi"
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      {:jose, "1.9.0"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end