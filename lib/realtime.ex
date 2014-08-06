defmodule Realtime do
	use Application

	def start(_type, _args) do
		Realtime.Supervisor.start_link() 
	end

end
