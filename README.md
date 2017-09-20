# Graphql

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Update config files
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Populate the database with `mix run priv/repo/seeds.exs`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) from your browser,
or use [`localhost:4000/api`](http://localhost:4000/api) for requests.

# API Example

* Returns list of all posts with comments, and users that made them
    ```
    {
      posts{
        title,
        body,
        user{
          id,
          email
        },
        comments{
          body,
          inserted_at,
          user{
            id,
            email
          }
        }        
      }
    }
    ```

* Returns a User by ID, containing all Comments the user made
    ```
    {
      user(id: 2){
        name,
        email,
        comments{
          body,
          post{
            id
          }
        }
      }
    }
    ```
