defmodule Realtime.Supervisor do
	use Supervisor

	def start_link do
		Supervisor.start_link(__MODULE__, []) 
	end

	def init([]) do
		children = []
		supervise(children, staregy: :one_for_one)
	end 

end