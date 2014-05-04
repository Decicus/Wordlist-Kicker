-- Wordlist Kicker --

local dir = "data/wordlist_kicker/"
local wordfile = "words.txt"
local fread = ULib.fileRead( dir .. wordfile )
local Wordlist = util.KeyValuesToTable( fread )

function WKCheckFiles()
	if not ULib.fileExists( dir ) then
		ULib.fileCreateDir( dir )
		ULib.fileWrite( dir .. wordfile, "" )
	end
end
hook.Add( "Initialize", "WKCheckFiles", WKCheckFiles ) -- Makes sure that the files exist.

function ulx.wkaddword( calling_ply, word, should_remove )

	local word = string.lower( word )

	if not should_remove then
		
		if table.HasValue( Wordlist, word ) then
		
			ULib.tsayError( calling_ply, "The word already exists in the wordlist." )
		
		else
			
			table.insert( Wordlist, word )
			ULib.fileWrite( dir .. wordfile, util.TableToKeyValues( Wordlist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A added '#s' to the wordlist.", word )
			
		end
		
	else
	
		if not table.HasValue( Wordlist, word ) then
			
			ULib.tsayError( calling_ply, "The word doesn't exist in the wordlist." )
			
		else
		
			table.RemoveByValue( Wordlist, word )
			ULib.fileWrite( dir .. wordfile, util.TableToKeyValues( Wordlist ) )
			ulx.fancyLogAdmin( calling_ply, true, "#A removed '#s' from the wordlist.", word )
			
		end
	end
	
end
local addword = ulx.command( CATEGORY_NAME, "ulx addword", ulx.wkaddword, "!addword", true )
addword:addParam{ type=ULib.cmds.StringArg, hint="Word to blacklist" }
addword:addParam{ type=ULib.cmds.BoolArg, invisible=true }
addword:defaultAccess( ULib.ACCESS_SUPERADMIN )
addword:help( "Adds a word to the Wordlist Kicker wordlist." )
addword:setOpposite( "ulx removeword", {_, _, true}, "!removeword", true )