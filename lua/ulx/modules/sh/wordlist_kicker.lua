-- Wordlist Kicker --

local dir = "data/wordlist_kicker/"
local wordfile = "words.txt"
local fread = ULib.fileRead( dir .. wordfile )

if fread then

	WKWordlist = util.KeyValuesToTable( fread )
	
else -- KeyValuesToTable errors out if the file doesn't exist.

	WKWordlist = {}

end

function ulx.wkaddword( calling_ply, word, should_remove )

	local word = string.lower( word ) -- All words should be saved lowercase.

	if not ULib.fileExists( dir ) then ULib.fileCreateDir( dir ) end -- Create the folder (if non-existant) so the wordlist can save.
	
	if not should_remove then
		
		if table.HasValue( WKWordlist, word ) then
		
			ULib.tsayError( calling_ply, "The word already exists in the wordlist." )

		else
			
			table.insert( WKWordlist, word )
			ULib.fileWrite( dir .. wordfile, util.TableToKeyValues( WKWordlist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A added '#s' to the wordlist.", word )
			
		end
		
	else
	
		if not table.HasValue( WKWordlist, word ) then
			
			ULib.tsayError( calling_ply, "The word doesn't exist in the wordlist." )
			
		else
		
			table.RemoveByValue( WKWordlist, word )
			ULib.fileWrite( dir .. wordfile, util.TableToKeyValues( WKWordlist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A removed '#s' from the wordlist.", word )
			
		end
		
	end
	
end
local addword = ulx.command( CATEGORY_NAME, "ulx addword", ulx.wkaddword, "!addword", true )
addword:addParam{ type=ULib.cmds.StringArg, hint="Word to blacklist" }
addword:addParam{ type=ULib.cmds.BoolArg, invisible=true }
addword:defaultAccess( ULib.ACCESS_SUPERADMIN )
addword:help( "Adds a word to the WKWordlist Kicker WKWordlist." )
addword:setOpposite( "ulx removeword", {_, _, true}, "!removeword", true )

function WKCheckNameJoin( ply )
	
	local name = string.lower( ply:Nick() ) -- Lowercase makes it a lot easier with comparing.
	
	for k, word in pairs( WKWordlist ) do
		
		local word = string.lower( word ) -- This shouldn't be required unless someone has manually edited "words.txt".
	
		if string.find( name, word, 1, true ) then
		
			ULib.kick( ply, "You got kicked for having a name that contained '" .. word .. "'." )
			return
			
		end
	
	end

end
hook.Add( "PlayerInitialSpawn", "WKCheckNameJoin", WKCheckNameJoin )

function WKCheckNameChange( ply, old, new )

	local new = string.lower( new )
	
	for k, word in pairs( WKWordlist ) do
	
		local word = string.lower( word )
		
		if string.find( new, word, 1, true ) then
			
			ULib.kick( ply, "You got kicked for changing to a name that contained '" .. word .. "'." )
			return
		
		end
		
	end
	
end
hook.Add( "ULibPlayerNameChanged", "WKCheckNameJoin", WKCheckNameJoin )