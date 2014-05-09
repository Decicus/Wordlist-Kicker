#Wordlist Kicker#

##What is Wordlist Kicker?##
Wordlist Kicker is a module/addon for the ULX admin mod created for Garry's Mod.  
The module allows server owners or admins to blacklist certain words that you want to prevent people from using in their nickname.  
(Don't mind the name, I think it needs to change too.)
  
##Planned features:##
- Clearing/deleting every word from the wordlist.
  
##Current features:##
- Adding/removing words from the wordlist.
- People get kicked if their name contains a blacklisted word on join/when they change their name to contain a blacklisted word.
- Ability to blacklist strings like "www." or "http://". (This has something to do with special characters being used in Lua's string library.)
- Whitelisting users/Steam ID's that will be ignored (WIP - Needs testing).
  
##Planned changes/other additions (non-features):##
- Config (WIP - Needs testing)
  
##Finished changes/other additions:##
- Change opposites (removing words/Steam ID's) to their own functions, for future customizations and better permission-customization for server owners.
  
##Downloads - Release Archives:##
- [Dropbox](https://www.dropbox.com/sh/tzeevvgh4yt3sif/6vY2b2T0ZF)
- [Google Drive](https://drive.google.com/folderview?id=0B0YQtzHyT_pdV1ZxUE1GOF8tQjA)
- [My website - Decicus.com] (http://decicus.com/wk/)
  
##Changelog:##
- ###Version 1.1:###
	- Added configuration (read above for help).
	- Added whitelisting of Steam ID's (players coming soon)
  
- ###Version 1.0:###
	- Added adding/removing words.
	- Added kicks (for anyone) if a blacklisted word is found in their name when they join.
	- Also kicks anyone that changes to a name that contains a blacklisted word.