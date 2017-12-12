defmodule BiWeb.HelloControllerTest do
  use BiWeb.ConnCase

  test "GET /hello", %{conn: conn} do
    conn = get conn, "/hello"
    assert html_response(conn, 200) =~ "Welcome Back!"
  end

  test "GET /hello/:messenger", %{conn: conn} do
    conn = get conn, "/hello/Yizhe"
    assert html_response(conn, 200) =~ "Hello!"
  end
end
