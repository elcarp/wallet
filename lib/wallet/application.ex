defmodule Wallet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Wallet.Balance, 0},
      Wallet.AccountHolder,
      Wallet.Transactions
      # Starts a worker by calling: Stateful.Worker.start_link(arg)
      # {Stateful.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wallet.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
