function myservice(applet)
   local response = "Hello World by myservice!"
   applet:set_status(200)
   applet:add_header("content-length", string.len(response))
   applet:add_header("content-type", "text/plain")
   applet:start_response()
   applet:send(response)
end

core.register_service("myservice", "http", myservice )
