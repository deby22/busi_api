defmodule BusiApiWeb.Auth.ErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, _reason}, _opts) do
    IO.inspect(type, label: "             type ")
    body = Jason.encode!(%{error: to_string(type)})
    IO.inspect(body, label: "             body ")

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, body)
  end
end
