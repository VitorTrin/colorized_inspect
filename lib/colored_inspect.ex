defmodule ColoredInspect do
  @moduledoc """
    Provides an inspect that has syntax highlighting.
  """

  def example do
    %{
      {'a', "b"} => :c,
      1 => 1.0,
      (1..10) => [1, 2],
      :r => ~r/rainbow/
    }
  end

  @doc """
    Simple wrapper over the IO.inspect/2 function that colorizes the output
  """
  @spec color_inspect(any()) :: any()
  def color_inspect(item, opts \\ []) do
    IO.inspect(
      item,
      [
        {
          :syntax_colors,
          # [
          #   number: :red,
          #   atom: :green,
          #   regex: :white,
          #   tuple: :yellow,
          #   map: :blue,
          #   list: :magenta
          # ])

          # rainbow
          # [
          #   number: :red,
          #   atom: :blue,
          #   regex: :white,
          #   tuple: :yellow,
          #   map: :green,
          #   list: :magenta,
          #   string: [:bright, :yellow]
          # ]

          # Default iex style
          # [
          #   number: :yellow,
          #   atom: :cyan,
          #   regex: :white,
          #   tuple: [:bright, :red],
          #   list: :magenta,
          #   string: :green
          # ]

          [
            number: [:bright, :red],
            atom: [:bright, :blue],
            regex: [:bright, :magenta],
            tuple: :yellow,
            list: :cyan,
            string: :green
          ]
        }
      ] ++ opts
    )
  end
end
