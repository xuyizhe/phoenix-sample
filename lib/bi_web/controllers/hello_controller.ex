defmodule BiWeb.HelloController do
  use BiWeb, :controller

  plug :assign_welcome_message, "Welcome Back" when action in [:index, :show]

  def index(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> put_flash(:hello_info, "What")
    |> put_flash(:hello_error, "Error")
    |> render("index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    # render conn, "show.html", messenger: messenger
    conn
    |> assign(:messenger, messenger)
    |> render("show.html")
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
