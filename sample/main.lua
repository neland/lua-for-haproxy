core.register_action("myaction", { "tcp-req", "http-req" }, function(txn)
   txn:Info("Hello world by my action")
end)

core.register_fetches("choose",function(txn)
	local path = txn.f:path()
	if path == "/9999" then
		return "service9999"
	end
	return "service8888"
end)

function myservice(applet)
   local response = "Hello World by myservice!"
   applet:set_status(200)
   applet:add_header("content-length", string.len(response))
   applet:add_header("content-type", "text/plain")
   applet:start_response()
   applet:send(response)
end

core.register_service("myservice", "http", myservice )
