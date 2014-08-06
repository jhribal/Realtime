defmodule Realtime.Mixfile do
  use Mix.Project

  def project do
    [app: :realtime,
     version: "0.0.1",
     elixir: "~> 0.15.0",
     deps: deps(Mix.env())]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  defp deps(:dev) do
    deps() ++ [{:ex_doc, github: "elixir-lang/ex_doc"}, {:earmark, github: "pragdave/earmark"}] 
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:bullet, git: "https://github.com/extend/bullet"}
    ]
  end
end
