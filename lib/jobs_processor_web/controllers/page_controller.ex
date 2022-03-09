defmodule JobsProcessorWeb.PageController do
  use JobsProcessorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
