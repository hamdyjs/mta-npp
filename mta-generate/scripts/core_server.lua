local import_file_content = [=[<NotepadPlus>
    <UserLang name="MTA-Lua" ext="lua" udlVersion="2.1">
        <Settings>
            <Global caseIgnored="no" allowFoldOfComments="no" foldCompact="no" forcePureLC="0" decimalSeparator="0" />
            <Prefix Keywords1="no" Keywords2="no" Keywords3="no" Keywords4="no" Keywords5="no" Keywords6="no" Keywords7="no" Keywords8="no" />
        </Settings>
        <KeywordLists>
            <Keywords name="Comments">00-- 01 02 03 04</Keywords>
            <Keywords name="Numbers, prefix1"></Keywords>
            <Keywords name="Numbers, prefix2"></Keywords>
            <Keywords name="Numbers, extras1"></Keywords>
            <Keywords name="Numbers, extras2"></Keywords>
            <Keywords name="Numbers, suffix1"></Keywords>
            <Keywords name="Numbers, suffix2"></Keywords>
            <Keywords name="Numbers, range"></Keywords>
            <Keywords name="Operators1">( ) , + - %% [ ] .. { }</Keywords>
            <Keywords name="Operators2"></Keywords>
            <Keywords name="Folders in code1, open"></Keywords>
            <Keywords name="Folders in code1, middle"></Keywords>
            <Keywords name="Folders in code1, close"></Keywords>
            <Keywords name="Folders in code2, open"></Keywords>
            <Keywords name="Folders in code2, middle"></Keywords>
            <Keywords name="Folders in code2, close"></Keywords>
            <Keywords name="Folders in comment, open"></Keywords>
            <Keywords name="Folders in comment, middle"></Keywords>
            <Keywords name="Folders in comment, close"></Keywords>
            <Keywords name="Keywords1">%s</Keywords>
            <Keywords name="Keywords2">%s</Keywords>
            <Keywords name="Keywords3">%s</Keywords>]]
            <Keywords name="Keywords4">root resourceRoot source client self resource exports localPlayer this guiRoot</Keywords>
            <Keywords name="Keywords5">local function for while in end do then else elseif break true false nil not or repeat return until and if</Keywords>
            <Keywords name="Keywords6">table debug coroutine string math</Keywords>
            <Keywords name="Keywords7">table.setn table.insert table.getn table.foreachi table.maxn table.foreach table.concat table.sort table.remove debug.getupvalue debug.debug debug.sethook debug.getmetatable debug.gethook debug.setmetatable debug.setlocal debug.traceback debug.setfenv debug.getinfo debug.setupvalue debug.getlocal debug.getregistry debug.getfenv coroutine.resume coroutine.yield coroutine.status coroutine.wrap coroutine.create coroutine.running string.sub string.upper string.len string.gfind string.rep string.find string.match string.char string.dump string.gmatch string.reverse string.byte string.format string.gsub string.lower math.log math.max math.acos math.huge math.ldexp math.pi math.cos math.tanh math.pow math.deg math.tan math.cosh math.sinh math.random math.randomseed math.frexp math.ceil math.floor math.rad math.abs math.sqrt math.modf math.asin math.min math.mod math.fmod math.log10 math.atan2 math.exp math.sin math.atan</Keywords>
            <Keywords name="Keywords8"></Keywords>
            <Keywords name="Delimiters">00&apos; 01\ 02&apos; 03&quot; 04\ 05&quot; 06[[ 07 08]] 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23</Keywords>
        </KeywordLists>
        <Styles>
            <WordsStyle name="DEFAULT" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="COMMENTS" fgColor="C0C0C0" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="LINE COMMENTS" fgColor="808080" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="NUMBERS" fgColor="A235A2" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS1" fgColor="FF8000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS2" fgColor="FF0000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS3" fgColor="0000FF" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS4" fgColor="008000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS5" fgColor="C9B700" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS6" fgColor="4AA5FF" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS7" fgColor="8000FF" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="KEYWORDS8" fgColor="000080" bgColor="FFFFFF" fontName="" fontStyle="2" nesting="0" />
            <WordsStyle name="OPERATORS" fgColor="0000FF" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="FOLDER IN CODE1" fgColor="C9B700" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="FOLDER IN CODE2" fgColor="C9B700" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="FOLDER IN COMMENT" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS1" fgColor="808080" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS2" fgColor="808080" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS3" fgColor="800000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS4" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS5" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS6" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS7" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
            <WordsStyle name="DELIMITERS8" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" nesting="0" />
        </Styles>
    </UserLang>
</NotepadPlus>]=]

addEvent("mta-generate.server.outputFunctions", true)
addEventHandler('mta-generate.server.outputFunctions', root, function (_client_functions)
	local _server_functions = {}
	for name, value in pairs(_G) do
		if (type(value) == "function") then
			table.insert(_server_functions, name)
		end
	end
	outputChatBox("Server Functions (#"..#_server_functions.."). Version"..getVersion()["sortable"], client, 255, 153, 0)

	table.sort(_server_functions)
	table.sort(_client_functions)
	
	for index, name in pairs(_server_functions) do
		if (DEPRECATED_FUNCTIONS[name:lower()]) then
			table.remove(_server_functions, index)
		end
	end
	for index, name in pairs(_client_functions) do
		if (DEPRECATED_FUNCTIONS[name:lower()]) then
			table.remove(_client_functions, index)
		end
	end
	
	local functions, general_functions = {}, {}
	local server_functions, client_functions = {}, {}
	
	for index, name in pairs(_server_functions) do
		table.insert(functions, name)
		local _index = findInTable(_client_functions, name)
		if (_index) then
			table.insert(general_functions, name)
			table.remove(_client_functions, _index)
		else
			table.insert(server_functions, name)
		end
	end

	for index, name in pairs(_client_functions) do
		table.insert(functions, name)
		local _index = findInTable(_server_functions, name)
		if (_index) then
			table.insert(general_functions, name)
			table.remove(_server_functions, _index)
		else
			table.insert(client_functions, name)
		end
	end
	
	outputChatBox("General Functions (#"..#general_functions..")".." - Total (#"..#functions..")", client, 255, 255, 0)
	
	local import_file = fileCreate('mtalua-lang-import.xml')
	fileWrite(import_file, string.format(import_file_content, table.concat(server_functions, ' '), table.concat(client_functions, ' '), table.concat(general_functions, ' ')))
	fileClose(import_file)
	
	local raw_file = fileCreate('raw_functions.txt')
	table.sort(functions)
	fileWrite(raw_file, table.concat(functions, '\n')..'\n')
	fileClose(raw_file)
	
	outputChatBox("Files Successfully Generated", client, 0, 255, 0)
	playSoundFrontEnd(client, 1)
end)

addCommandHandler("generate", function(player) 
	triggerClientEvent(player, 'mta-generate.client.getClientFunctions', root)
end)

function findInTable(table, value)
	for index, value2 in pairs(table) do
		if (value == value2) then
			return index
		end
	end
	return false
end

DEPRECATED_FUNCTIONS = {
	["addplayerclothes"] = true,
	["attachelementtoelement"] = true,
	["banserial"] = true,
	["canplayerbeknockedoffbike"] = true,
	["canplayerusefunction"] = true,
	["detachelementfromelement"] = true,
	["doesplayerhavejetpack"] = true,
	["dxdrawcolortext"] = true,
	["engineimportcol"] = true,
	["engineunloadmodel"] = true,
	["getaccountclient"] = true,
	["getbansxml"] = true,
	["getcamerafixedmodetarget"] = true,
	["getcameramode"] = true,
	["getcameraposition"] = true,
	["getcamerarotation"] = true,
	["getclientaccount"] = true,
	["getclientip"] = true,
	["getclientname"] = true,
	["getmtaversion"] = true,
	["getobjectmodel"] = true,
	["getobjectrotation"] = true,
	["getpedskin"] = true,
	["getplayerammoinclip"] = true,
	["getplayerarmor"] = true,
	["getplayerclothes"] = true,
	["getplayercontactelement"] = true,
	["getplayerfightingstyle"] = true,
	["getplayerfromnick"] = true,
	["getplayergravity"] = true,
	["getplayeroccupiedvehicle"] = true,
	["getplayeroccupiedvehicleseat"] = true,
	["getplayerrotation"] = true,
	["getplayersimplesttask"] = true,
	["getplayerskin"] = true,
	["getplayerstat"] = true,
	["getplayertarget"] = true,
	["getplayertargetcollision"] = true,
	["getplayertargetend"] = true,
	["getplayertargetstart"] = true,
	["getplayertask"] = true,
	["getplayertotalammo"] = true,
	["getplayerusername"] = true,
	["getplayerweapon"] = true,
	["getplayerweaponslot"] = true,
	["getvehicleid"] = true,
	["getvehicleidfromname"] = true,
	["getvehiclenamefromid"] = true,
	["getvehiclerotation"] = true,
	["giveplayerjetpack"] = true,
	["giveweaponammo"] = true,
	["guieditsetcaratindex"] = true,
	["guimemosetcaratindex"] = true,
	["isobjectstatic"] = true,
	["ispedfrozen"] = true,
	["ispedinwater"] = true,
	["isplayerchoking"] = true,
	["isplayerdead"] = true,
	["isplayerdoingtask"] = true,
	["isplayerducked"] = true,
	["isplayerinvehicle"] = true,
	["isplayerinwater"] = true,
	["isplayeronground"] = true,
	["isvehiclefrozen"] = true,
	["killplayer"] = true,
	["makepedusegun"] = true,
	["onclientchangenick"] = true,
	["onclientlogout"] = true,
	["onmapload"] = true,
	["onmapunload"] = true,
	["randfloat"] = true,
	["randint"] = true,
	["removeplayerclothes"] = true,
	["removeplayerfromteam"] = true,
	["removeplayerfromvehicle"] = true,
	["removeplayerjetpack"] = true,
	["revised coding guidelines"] = true,
	["rotatecameraright"] = true,
	["rotatecameraup"] = true,
	["setcameralookat"] = true,
	["setcameramode"] = true,
	["setcameraposition"] = true,
	["setclientname"] = true,
	["setobjectmodel"] = true,
	["setobjectrotation"] = true,
	["setobjectstatic"] = true,
	["setpedfrozen"] = true,
	["setpedskin"] = true,
	["setplayerarmor"] = true,
	["setplayercanbeknockedoffbike"] = true,
	["setplayerchoking"] = true,
	["setplayerfightingstyle"] = true,
	["setplayergravity"] = true,
	["setplayerrotation"] = true,
	["setplayerskin"] = true,
	["setplayerstat"] = true,
	["setplayerweaponslot"] = true,
	["setvehiclefrozen"] = true,
	["setvehiclemodel"] = true,
	["setvehiclerotation"] = true,
	["takeweaponammo"] = true,
	["togglecamerafixedmode"] = true,
	["unbanip"] = true,
	["unbanserial"] = true,
	["warpplayerintovehicle"] = true,
	["xmlcreatesubnode"] = true,
	["xmlfindsubnode"] = true,
}