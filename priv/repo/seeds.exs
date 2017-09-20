# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Graphql.Repo.insert!(%Graphql.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Graphql.User
alias Graphql.Post
alias Graphql.Repo
alias Graphql.Comment

Repo.insert!(%User{name: "Mister Pink", email: "mrpink@mailor.com"})
Repo.insert!(%User{name: "Madam Black", email: "msblack@mailor.com"})
Repo.insert!(%User{name: "Mister Green", email: "mrgreen@mailor.com"})
Repo.insert!(%User{name: "Madam Blue", email: "msblue@mailor.com"})

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1,2,3,4] |> Enum.take_random(1) |> hd
    })
end

posts = Repo.all(Post) |> Repo.preload(:comments) |> Repo.preload(:user)
for post <- posts do
  Repo.insert!(%Comment{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1,2,3,4] |> Enum.take_random(1) |> hd,
    post_id: post.id
    })
end
