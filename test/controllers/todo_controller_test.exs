# Create this test in test/controllers/todo_controller_test.exs
defmodule Todos.TodoControllerTest do
  use Todos.ConnCase

  test "#index renders a list of todos" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :index)

    assert json_response(conn, 200) == render_json("index.json", todos: [todo])
  end

  test "#show renders a single todo" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :show, todo)

    assert json_response(conn, 200) == render_json("show.json", todo: todo)
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    Todos.TodoView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end

end
