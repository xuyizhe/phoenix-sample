defmodule BiWeb.Router do
  use BiWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug :authenticate_user

    # plug MyAuth
    # plug :put_user_token
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/test", PageController, :test
    # get "/:messenger", PageController, :show
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController, only: [:index]

    resources "/sessions", SessionController,
      only: [:new, :create, :delete],
      singleton: true

    # resources "/users", UserController do
    #   resources "/posts", PostController, only: [:index, :show]
    # end

    # resources "/comments", CommentController, except: [:delete]
  end

  # scope "/", BiWeb do
  #   get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  # end

  # scope "/admin", BiWeb.Admin, as: :admin do
  #   pipe_through :browser # Use the default browser stack

  #   resources "/images", ImageController
  #   resources "/reviews", ReviewController
  #   resources "/users", UserController
  # end

  # Other scopes may use custom stacks.
  # scope "/api", BiWeb do
  #   pipe_through :api
  # end


  # scope "/api", BiWeb.Api, as: :api do
  #   pipe_through :api

  #   scope "/v1", V1, as: :v1 do
  #     resources "/images", ImageController
  #   end
  # end


  defp put_user_token(conn, _) do
    if current_user = conn.assigns[:current_user] do
      token = Phoenix.Token.sign(conn, "user socket", current_user.id)
      assign(conn, :user_token, token)
    else
      conn
    end
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Bi.Accounts.get_user!(user_id))
    end
  end
end
