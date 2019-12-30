defmodule ColorizedInspect.MixProject do
  use Mix.Project

  def project do
    [
      app: :colorized_inspect,
      version: "1.1.0",
      elixir: "~> 1.7",
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false}
    ]
  end

  defp description do
    "Provides an inspect that has syntax highlighting."
  end

  defp package do
    [
      licenses: ["Unlicense"],
      links: %{"GitHub" => "https://github.com/VitorTrin/colorized_inspect"}
    ]
  end
end
