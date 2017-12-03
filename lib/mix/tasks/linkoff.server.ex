defmodule Mix.Tasks.Linkoff.Server do
  use Mix.Task

  @shortdoc "Launch the LinkOff server"

  def run([ip, port]) do
    Application.put_env(:link_off, :bind_to_ip, ip)
    run([port])
  end
  def run([port]) do
    Application.put_env(:link_off, :bind_to_port, port |> String.to_integer)
    run([])
  end
  def run([]) do
    Mix.Tasks.Run.run(["--no-halt"])
  end

  def run(_) do
    Mix.raise """
    Usage:

      mix linkoff.server
      mix linkoff.server <port>
      mix linkoff.server <bind to IP> <port>
    """
  end
end
