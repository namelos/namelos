defmodule Namelos.Web.Router do
  use Namelos.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Namelos.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/graphql", Absinthe.Plug, schema: Namelos.Web.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Namelos.Web.Schema
  # Other scopes may use custom stacks.
  # scope "/api", Namelos.Web do
  #   pipe_through :api
  # end
end
