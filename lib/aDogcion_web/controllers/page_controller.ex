defmodule ADogcionWeb.PageController do
  use ADogcionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
