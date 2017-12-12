defmodule BiWeb.PageController do
  use BiWeb, :controller

  def index(conn, params) do
    # render conn, "index.html"
    # render conn, :index, message: params["message"]

    # conn
    # |> put_status(:not_found)
    # |> put_view(BiWeb.ErrorView)
    # |> render("404.html")
    # |> assign(:message, params["message"])
    # |> render(:index)

    # redirect conn, to: "/redirect_test"
    # redirect conn, external: "https://elixir-lang.org/"
    # redirect conn, to: redirect_test_path(conn, :redirect_test)
    # redirect conn, external: redirect_test_url(conn, :redirect_test)

    pages = [
      %{title: "foo"},
      %{title: "bar"}
    ]

    render conn, "index.json", pages: pages
  end

  def show(conn, %{"messenger" => messenger}) do
    page = %{title: messenger}

    render conn, "show.json", page: page
  end

  def test(conn, _params) do
    render conn, "test.html"
  end

  def redirect_test(conn, _params) do
    text conn, "Redirect!"
  end
end
