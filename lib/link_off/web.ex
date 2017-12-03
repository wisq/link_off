defmodule LinkOff.Web do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:urlencoded]
  plug :dispatch

  # Facebook Messenger links (l.messenger.com)
  get "/l.php" do
    url = conn.query_params |> Map.fetch!("u")

    conn
    |> put_resp_header("location", url)
    |> send_resp(301, "Redirecting to #{url}")
  end
end
