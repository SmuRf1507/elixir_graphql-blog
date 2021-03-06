defmodule Graphql.Router do
  use Graphql.Web, :router

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

  scope "/", Graphql do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug, schema: Graphql.Schema

  forward "graphiql", Absinthe.Plug.GraphiQL, schema: Graphql.Schema

  # Other scopes may use custom stacks.
  # scope "/api", Graphql do
  #   pipe_through :api
  # end
end
