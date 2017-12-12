defmodule BiWeb.PageView do
  use BiWeb, :view

  def title do
    "Awesome New Title!"
  end

  # def render("index.html", assigns) do
  #   "render with assigns #{inspect Map.keys(assigns)}"
  # end

  def message do
    "Hello from the view!"
  end

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, __MODULE__, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, __MODULE__, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end

  def handle_info(conn) do
    "Request Handled By: #{controller_module conn}.#{action_name conn}"
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct
    |> Map.keys
  end
end
