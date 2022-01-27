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



{:ok, elixir}  = Library.create_category(%{name: "Elixir"})
{:ok, phoenix} = Library.create_category(%{name: "Phoenix"})
{:ok, otp}     = Library.create_category(%{name: "OTP"})
{:ok, testing} = Library.create_category(%{name: "Testing"})
{:ok, ecto}    = Library.create_category(%{name: "Ecto"})

{:ok, author} = Library.create_author(%{first_name: "Tony", last_name: "Hammond"})
{:ok, book}   = Library.create_book(%{
                  title: "Exploring Graphs with Elixir",
                  description: "Data is everywhere—it’s just not very well connected, which makes it super hard to relate dataset to dataset. Using graphs as the underlying glue, you can readily join data together and create navigation paths across diverse sets of data. Add Elixir, with its awesome power of concurrency, and you’ll soon be mastering data networks. Learn how different graph models can be accessed and used from within Elixir and how you can build a robust semantics overlay on top of graph data structures. We’ll start from the basics and examine the main graph paradigms. Get ready to embrace the world of connected data!",
                  author_id: author.id,
                  cover: "exploring-graphs-with-elixir-cover.jpg"})
Library.create_book_category(%{book_id: book.id, category_id: elixir.id})

{:ok, author} = Library.create_author(%{first_name: "Svilen", last_name: "Gospodinov"})
{:ok, book}   = Library.create_book(%{
                  title: "Concurrent Data Processing in Elixir",
                  description: "Learn different ways of writing concurrent code in Elixir and increase your application’s performance, without sacrificing scalability or fault-tolerance. Most projects benefit from running background tasks and processing data concurrently, but the world of OTP and various libraries can be challenging. Which Supervisor and what strategy to use? What about GenServer? Maybe you need back-pressure, but is GenStage, Flow, or Broadway a better choice? You will learn everything you need to know to answer these questions, start building highly concurrent applications in no time, and write code that’s not only fast, but also resilient to errors and easy to scale.",
                  author_id: author.id,
                  cover: "concurrent-data-processing-in-elixir-cover.jpg"})
Library.create_book_category(%{book_id: book.id, category_id: elixir.id})
Library.create_book_category(%{book_id: book.id, category_id: otp.id})

{:ok, author} = Library.create_author(%{first_name: "Sean", last_name: "Moriarity"})
{:ok, book}   = Library.create_book(%{
                  title: "Genetic Algorithms in Elixir",
                  description: "From finance to artificial intelligence, genetic algorithms are a powerful tool with a wide array of applications. But you don’t need an exotic new language or framework to get started; you can learn about genetic algorithms in a language you’re already familiar with. Join us for an in-depth look at the algorithms, techniques, and methods that go into writing a genetic algorithm. From introductory problems to real-world applications, you’ll learn the underlying principles of problem solving using genetic algorithms.",
                  author_id: author.id,
                  cover: "genetic-algorithms-in-elixir-cover.jpg"})
Library.create_book_category(%{book_id: book.id, category_id: elixir.id})
Library.create_book_category(%{book_id: book.id, category_id: otp.id})

{:ok, author} = Library.create_author(%{first_name: "Fred", last_name: "Herbert"})
{:ok, book}   = Library.create_book(%{
                  title: "Property-Based Testing with PropEr, Erlang, and Elixir",
                  description: "Property-based testing helps you create better, more solid tests with little code. By using the PropEr framework in both Erlang and Elixir, this book teaches you how to automatically generate test cases, test stateful programs, and change how you design your software for more principled and reliable approaches. You will be able to better explore the problem space, validate the assumptions you make when coming up with program behavior, and expose unexpected weaknesses in your design. PropEr will even show you how to reproduce the bugs it found. With this book, you will be writing efficient property-based tests in no time.",
                  author_id: author.id,
                  cover: "property-based-testing-cover.jpg"})
Library.create_book_category(%{book_id: book.id, category_id: elixir.id})
Library.create_book_category(%{book_id: book.id, category_id: testing.id})

{:ok, author} = Library.create_author(%{first_name: "Dave", last_name: "Thomas"})
{:ok, book}   = Library.create_book(%{
                  title: "Programming Elixir 1.6",
                  description: "This book is the introduction to Elixir for experienced programmers, completely updated for Elixir 1.6 and beyond. Explore functional programming without the academic overtones (tell me about monads just one more time). Create concurrent applications, but get them right without all the locking and consistency headaches. Meet Elixir, a modern, functional, concurrent language built on the rock-solid Erlang VM. Elixir’s pragmatic syntax and built-in support for metaprogramming will make you productive and keep you interested for the long haul. Maybe the time is right for the Next Big Thing. Maybe it’s Elixir.",
                  author_id: author.id,
                  cover: "programming-elixir-cover.jpg"})
Library.create_book_category(%{book_id: book.id, category_id: elixir.id})
Library.create_book_category(%{book_id: book.id, category_id: otp.id})

{:ok, author} = Library.create_author(%{first_name: "Stephen", last_name: "Bussey"})
{:ok, book}   = Library.create_book(%{
                  title: "Real-Time Phoenix",
                  description: "Give users the real-time experience they expect, by using Elixir and Phoenix Channels to build applications that instantly react to changes and reflect the application’s true state. Learn how Elixir and Phoenix make it easy and enjoyable to create real-time applications that scale to a large number of users. Apply system design and development best practices to create applications that are easy to maintain. Gain confidence by learning how to break your applications before your users do. Deploy applications with minimized resource use and maximized performance.",
                  author_id: author.id,
                  cover: "real-time-phoenix.jpg"})
Library.create_book_category(%{book_id: book.id, category_id: elixir.id})
Library.create_book_category(%{book_id: book.id, category_id: phoenix.id})
