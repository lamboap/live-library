# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveLibrary.Repo.insert!(%LiveLibrary.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveLibrary.Library

Library.create_author(%{first_name: "Moebi", last_name: "The Dog"})
Library.create_book(%{title: "Rock Around 101", description: "How to play with rocks", author_id: 1})
Library.create_category(%{name: "Elixir"})
