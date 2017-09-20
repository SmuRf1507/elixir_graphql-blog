defmodule Graphql.Schema do
  use Absinthe.Schema
  import_types Graphql.Schema.Types

  # Client Request Endpoints
  query do
    ####################
    ### Post Requests
    ####################
    # request: {posts{title,body}} / returns list of all posts
    field :posts, list_of(:post) do
      resolve &Graphql.PostResolver.all/2
    end

    # request: {post(id: 1){title,body}} / returns the post for a given id
    field :post, type: :post do
      arg :id, non_null(:id)
      resolve &Graphal.PostResolver.get/2
    end



    ####################
    ### User Requests
    ####################
    # request: {users{name,email}} / returns list of all users
    field :users, list_of(:user) do
      resolve &Graphql.UserResolver.all/2
    end

    # request: {user(id: 1){name,email}} / returns the user for a given id
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &Graphql.UserResolver.get/2
    end



    ####################
    ### Comment Requests
    ####################
    # get list of all comments
    field :comments, type: list_of(:comment) do
      resolve &Graphql.CommentResolver.all/2
    end

    # Get one Comment
    # request: {comment(id: 1){name,email}} / returns the user for a given id
    # request: {comment(id: 1){name,email,post{title,..}, user{name,..}}} / returns the user for a given id, with given associations
    field :comment, type: :comment do
      arg :id, non_null(:id)
      resolve &Graphql.CommentResolver.get/2
    end

  end

  # to request all users containing their posts
  # { users { name, posts{  body, title}}}

  # to request all posts containing their user
  # { posts { title, body, user{  name}}}
end
