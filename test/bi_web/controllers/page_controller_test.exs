defmodule BiWeb.PageControllerTest do
  use BiWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  # test "GET /?_format=text", %{conn: conn} do
  #   conn = get conn, "/?_format=text"
  #   assert text_response(conn, 200) =~ "OMG, this is actually some text."
  # end
end
