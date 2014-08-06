defmodule Realtime.BulletHandler do

	@moduledoc """
	# Implements callbacks needed by bullet handler used in cowboy.

	`init/4` and `terminate/2` functions are called everytime a connection 
	is made or closed, respectively, which can happen many times over 
	the course of a bullet connection's life.
	
	## Types

	- active 
		- `:once` - xhr long polling (eg. ajax) 
		- `true` - websocket or eventsouce 
		- `false` - POST request (eg. client is sending message)

	- transport
		- `:tcp` - should be websocket connnection

	### To setup cowboy with bullet and this handler, you can use this:

		Dispatch = cowboy_router:compile([
    		{'_', [{"/realtime", :bullet_handler, handler: Realtime.BulletHandler}]}
    	]),
    	cowboy:start_http(:my_http_listener, 100, [port: 8080],
        	[env: [dispatch: Dispatch]] 

	"""

	#https://github.com/extend/bullet

	@type req :: :cowboy_req.req() 
	@type transport :: {:tcp, :http} | :tcp
	@type active :: :once | true | false
	@type state :: term

	@doc """
	Called when new bullet handler connection received.
	
	"""
	@spec init(transport, req, list, active) :: {:ok, req, state} | {:shutdown, req, state}
	def init(_transport, req, _opts, _active) do
    	{:ok, req, :undefined_state}
	end

	def stream(data, req, state) do
    	{:reply, data, req, state}
	end

	def info(_info, req, state) do
    	{:ok, req, state}
	end

	@doc """
	Called when request is closed
	"""
	def terminate(_req, _state) do
    	:ok
	end

end