# In test/views/todo_view_test.exs
defmodule Todos.TodoViewTest do
  use Todos.ConnCase
  import Todos.Factory
  alias Todos.TodoView

  test "todo_json" do
    todo = insert(:todo)

    rendered_todo = TodoView.todo_json(todo)

    assert rendered_todo == %{
      title: todo.title,
      description: todo.description,
      inserted_at: todo.inserted_at,
      updated_at: todo.updated_at
    }
  end

  test "index.json" do
    todo = insert(:todo)

    rendered_todos = TodoView.render("index.json", %{todos: [todo]})

    assert rendered_todos == %{
      todos: [TodoView.todo_json(todo)]
    }
  end

  test "show.json" do
    todo = insert(:todo)

    rendered_todo = TodoView.render("show.json", %{todo: todo})

    assert rendered_todo == %{
      todo: TodoView.todo_json(todo)
    }
  end
end
