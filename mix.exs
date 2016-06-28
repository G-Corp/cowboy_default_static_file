defmodule Cowboy.Default.Static.File.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cowboy_default_static_file,
      version: "1.2.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [
       applications: [:bucs, :cowboy],
       env: []
    ]
  end

  defp deps do
    [
      {:bucs, "~> 0.1.0"},
      {:cowboy, git: "https://github.com/ninenines/cowboy.git", tag: "2.0.0-pre.3"}    
    ]
  end
end