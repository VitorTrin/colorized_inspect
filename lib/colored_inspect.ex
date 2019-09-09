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
  def color_inspect(item, opts \\ []) when is_list(opts) do
    IO.inspect(
      item,
      [
        {
          :syntax_colors,
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
