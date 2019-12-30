defmodule CI do
  @moduledoc """
  Alias to shorten the call.
  """
  defdelegate inspect(item), to: ColorizedInspect, as: :color_inspect
  defdelegate inspect(item, opts), to: ColorizedInspect, as: :color_inspect
end
