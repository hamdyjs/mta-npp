outputChatBox("Notepad++ Auto Complete Generator Started. Type /generate to generate the file.", 255, 255, 0)

addEvent("mta-generate.client.getClientFunctions", true)
addEventHandler("mta-generate.client.getClientFunctions", root, function()
	local client_functions = {}
	for name, value in pairs(_G) do
		if (type(value) == "function") then
			table.insert(client_functions, name)
		end
	end
	outputChatBox("Client Functions (#"..#client_functions.."). Version"..getVersion()["sortable"], 255, 0, 0)
	triggerServerEvent("mta-generate.server.outputFunctions", root, client_functions)
end)