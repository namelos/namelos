defmodule NamelosWeb.PageController do
  use NamelosWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
