-- Wordlist Kicker --
local CATEGORY_NAME = "Wordlist Kicker"
local dir = "data/wordlist_kicker/"
local wordfile = "words.txt"
local whitelistfile = "whitelist.txt"
local wordread = ULib.fileRead( dir .. wordfile )
local whiteread = ULib.fileRead( dir .. whitelistfile )

-- Don't touch.
local WKWordlist = {}
local WKWhitelist = {}

-- KeyValuesToTabel errors out if file is nil
if wordread then WKWordlist = util.KeyValuesToTable( wordread )	end
if whiteread then WKWhitelist = util.KeyValuesToTable( whiteread ) end

--[[
	Wordlist Start
]]
function ulx.wkwhitelist( calling_ply, word, should_remove )

	local word = string.lower( word ) -- All words should be saved lowercase.

	if not ULib.fileExists( dir ) then ULib.fileCreateDir( dir ) end -- Create the folder (if non-existant) so the wordlist can save.
	
	if not should_remove then
		
		if table.HasValue( WKWordlist, word ) then
		
			ULib.tsayError( calling_ply, "The word already exists in the wordlist." )

		else
			
			table.insert( WKWordlist, word )
			ULib.fileWrite( dir .. wordfile, util.TableToKeyValues( WKWordlist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A added '#s' to the Wordlist Kicker wordlist.", word )
			
		end
		
	else
	
		if not table.HasValue( WKWordlist, word ) then
			
			ULib.tsayError( calling_ply, "The word doesn't exist in the wordlist." )
			
		else
		
			table.RemoveByValue( WKWordlist, word )
			ULib.fileWrite( dir .. wordfile, util.TableToKeyValues( WKWordlist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A removed '#s' from the Wordlist Kicker wordlist.", word )
			
		end
		
	end
	
end
local whitelist = ulx.command( CATEGORY_NAME, "ulx whitelist", ulx.wkwhitelist, "!whitelist", true )
whitelist:addParam{ type=ULib.cmds.StringArg, hint="Word to blacklist" }
whitelist:addParam{ type=ULib.cmds.BoolArg, invisible=true }
whitelist:defaultAccess( ULib.ACCESS_SUPERADMIN )
whitelist:help( "Adds a word to the Wordlist Kicker wordlist." )
whitelist:setOpposite( "ulx removeword", {_, _, true}, "!removeword", true )

function WKCheckNameJoin( ply )
	
	local name = string.lower( ply:Nick() ) -- Lowercase makes it a lot easier with comparing.
	
	local sid = ply:SteamID()
	
	if table.HasValue( WKWhitelist, sid ) then return end
	
	for k, word in pairs( WKWordlist ) do
		
		local word = string.lower( word ) -- This shouldn't be required unless someone has manually edited "words.txt".
	
		if string.find( name, word, 1, true ) then
		
			ULib.kick( ply, "You got automatically kicked for having a name that contained '" .. word .. "'." )
			return
			
		end
	
	end

end
hook.Add( "PlayerInitialSpawn", "WKCheckNameJoin", WKCheckNameJoin )

function WKCheckNameChange( ply, old, new )

	local new = string.lower( new )
	
	if table.HasValue( WKWhitelist, sid ) then return end
	
	for k, word in pairs( WKWordlist ) do
	
		local word = string.lower( word )
		
		if string.find( new, word, 1, true ) then
			
			ULib.kick( ply, "You got automatically kicked for changing to a name that contained '" .. word .. "'." )
			return
		
		end
		
	end
	
end
hook.Add( "ULibPlayerNameChanged", "WKCheckNameJoin", WKCheckNameJoin )
--[[
	Wordlist End
]]


--[[
	Whitelist Start
]]
function ulx.wkwhitelistadd( calling_ply, sid )
	
	local sid = string.upper( sid ) -- Make sure the Steam ID is uppercase
	
	if not ULib.fileExists( dir ) then ULib.fileCreateDir( dir ) end -- Create the folder if it doesn't exist so whitelist can save.
	
	if not ULib.isValidSteamID( sid ) then
		
		ULib.tsayError( calling_ply, "Invalid Steam ID." )
		
	else
		
		if table.HasValue( WKWhitelist, sid ) then
			
			ULib.tsayError( calling_ply, "Steam ID is already whitelisted." )
			
		else
			
			table.insert( WKWhitelist, word )
			ULib.fileWrite( dir .. whitelistfile, util.TableToKeyValues( WKWhitelist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A added #s to the Wordlist Kicker whitelist.", sid )
			
		end

	end

end
local whitelistadd = ulx.command( CATEGORY_NAME, "ulx whitelist", ulx.wkwhitelistadd, "!whitelist", true )
whitelistadd:addParam{ type=ULib.cmds.StringArg, hint="Steam ID to whitelist" }
whitelistadd:defaultAccess( ULib.ACCESS_SUPERADMIN )
whitelistadd:help( "Whitelists a Steam ID to the Wordlist Kicker wordlist." )

function ulx.wkwhitelistremove( calling_ply, sid )

	local sid = string.upper( sid )
	
	if not ULib.fileExists( dir ) then ULib.fileCreateDir( dir ) end
	
	if not ULib.isValidSteamID( sid ) then
		
		ULib.tsayError( calling_ply, "Invalid Steam ID." )
		
	else
	
		if not table.HasValue( WKWhitelist, sid ) then
			
			ULib.tsayError( calling_ply, "Steam ID doesn't exist in the whitelist." )
		
		else
		
			table.RemoveByValue( WKWhitelist, sid )
			ULib.fileWrite( dir .. whitelistfile, util.TableToKeyValues( WKWhitelist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A removed #s from the Wordlist Kicker whitelist.", sid )
			
		end
		
	end

end
local whitelistremove = ulx.command( CATEGORY_NAME, "ulx unwhitelist", ulx.wkwhitelistadd, "!unwhitelist", true )
whitelistremove:addParam{ type=ULib.cmds.StringArg, hint="Steam ID to unwhitelist" }
whitelistremove:defaultAccess( ULib.ACCESS_SUPERADMIN )
whitelistremove:help( "Unwhitelists a Steam ID from the Wordlist Kicker whitelist." )
--[[
	Whitelist End
]]