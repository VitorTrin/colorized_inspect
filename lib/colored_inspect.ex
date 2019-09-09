defmodule ColorizedInspect do
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
    Simple wrapper over the IO.inspect/2 function that colorizes the output.
    The opts are the same opts as IO.inspect/2.
  """
  @spec color_inspect(any(), keyword()) :: any()
  def color_inspect(item, opts \\ []) when is_list(opts) do
    IO.inspect(item, [syntax_colors: color_scheme()] ++ opts)
  end

  defp color_scheme do
    default_color_scheme = [
      number: [:bright, :red],
      atom: [:bright, :blue],
      regex: [:bright, :magenta],
      tuple: :yellow,
      list: :cyan,
      string: :green
    ]

    Application.get_env(:colorized_inspect, :color_scheme, default_color_scheme)
  end
end
