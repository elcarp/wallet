defmodule Wallet.Transactions do
    use Agent
  
    def start_link(initial_state \\ []) do
      Agent.start_link(fn -> initial_state end, name: __MODULE__)
    end
  
    def all do
      Agent.get(__MODULE__, fn state -> state end)
    end
  
    def find(id) do
      Agent.get(__MODULE__, fn state ->
        Enum.find(state, fn item -> item.id == id end)
      end)
    end
  
    def append(addition) do
      Agent.update(__MODULE__, fn state -> state ++ addition end)
    end
  end
  