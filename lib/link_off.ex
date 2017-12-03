defmodule LinkOff do
  use Application
  require Logger

  @version Mix.Project.config[:version]
  def version, do: @version

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    children =
      if web_enabled?() do
        [Plug.Adapters.Cowboy.child_spec(:http, LinkOff.Web, [], web_options())]
      else
        []
      end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LinkOff.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp web_enabled? do
    !iex_running?() && Application.get_env(:link_off, :web_enabled, true)
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) and IEx.started?
  end

  defp web_options do
    ip   = Application.get_env(:link_off, :bind_to_ip, "127.0.0.1")
    port = Application.get_env(:link_off, :bind_to_port, 4242)
    Logger.info("LinkOff setting up on IP #{ip}, port #{port}.")
    [ip: ip_tuple(ip), port: port]
  end

  defp ip_tuple(str) do
    str
    |> String.split(".")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end
end
