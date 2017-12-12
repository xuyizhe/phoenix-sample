defmodule BiWeb.UserView do
  use BiWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, __MODULE__, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      name: user.name,
      username: user.username,
      credential: inspect user[:credential]
    }
  end
end
