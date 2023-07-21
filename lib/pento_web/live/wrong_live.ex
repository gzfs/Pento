defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, message: "Make a Guess!!")}
  end

  def handle_event("guess", %{"number" => guess} = _data, socket) do
    {:noreply,
     assign(socket, score: socket.assigns.score - 1, message: "Your guess #{guess} is Wrong!!")}
  end

  def render(assigns) do
    ~H"""
    <h1>Your Score: <%= @score %></h1>
    <h2><%= @message %></h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={n}><%= n %></a>
      <% end %>
    </h2>
    """
  end
end
