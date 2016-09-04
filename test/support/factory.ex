# Create the factory in test/support/factory.ex
defmodule Todos.Factory do
  use ExMachina.Ecto, repo: Todos.Repo

  def todo_factory do
    %Todos.Todo{
      title: "Something I need to do",
      description: "List of steps I need to complete"
    }
  end
end
