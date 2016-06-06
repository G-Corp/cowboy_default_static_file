defmodule Cowboy.Default.Static.File.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cowboy_default_static_file,
      version: "1.1.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [
       applications: [:kernel, :stdlib, :bucs, :cowboy],
       env: []
    ]
  end

  defp deps do
    [
      {:bucs, git: "https://github.com/botsunit/bucs.git", branch: "master"},
      {:cowboy, git: "https://github.com/ninenines/cowboy.git", tag: "2.0.0-pre.3"}    
    ]
  end
end