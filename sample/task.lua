function mytask()
   while true do
      core.msleep( 1000 )
      print( "Hello World by my task!\n" )
   end
end
core.register_task( mytask )

function myinit()
   print("Hello World by my init!\n")
end
core.register_init( myinit )
