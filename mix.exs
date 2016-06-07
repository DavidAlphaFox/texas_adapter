defmodule Texas.Adapter.Mixfile do
  use Mix.Project

  def project do
    [
      app: :texas_adapter,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [
       applications: [],
       env: []
    ]
  end

  defp deps do
    [    
    ]
  end
end