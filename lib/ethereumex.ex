defmodule Ethereumex do
  use Application
  @moduledoc File.read!("#{__DIR__}/../README.md")

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = Ethereumex.Config.setup_children()

    opts = [strategy: :one_for_one, name: Ethereumex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
