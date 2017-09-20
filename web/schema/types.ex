# Module for GraphQL type schemas
defmodule Graphql.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Graphql.Repo


  # Define the User Type
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :posts, list_of(:post), resolve: assoc(:posts)
    field :comments, list_of(:comment), resolve: assoc(:comments)
  end

  # Define the Post Type
  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :user, resolve: assoc(:user)
    field :comments, list_of(:comment), resolve: assoc(:comments)
  end

  # Define the Comment Type
  # Post and User have multiple Comments
  object :comment do
    field :id, :id
    field :title, :string
    field :body, :string
    field :inserted_at, :string
    field :user, :user, resolve: assoc(:user)
    field :post, :post, resolve: assoc(:post)
  end
end
