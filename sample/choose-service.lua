core.register_fetches("choose",function(txn)
	local path = txn.f:path()
	if path == "/9999" then
		return "service9999"
	end
	return "service8888"
end)
