#Wordlist Kicker#

##What is Wordlist Kicker?##
Wordlist Kicker is a module/addon for the ULX admin mod created for Garry's Mod.  
The module allows server owners or admins to blacklist certain words that you want to prevent people from using in their nickname.  
(Don't mind the name, I think it needs to change too.)
  
##Planned features:##
- Clearing/deleting every word from the wordlist (Config)
  
##Current features:##
- Adding/removing words from the wordlist.
- People get kicked if their name contains a blacklisted word on join/when they change their name to contain a blacklisted word.
- Ability to blacklist strings like "www." or "http://". (This has something to do with special characters being used in Lua's string library.)
- Whitelisting users/Steam ID's that will be ignored (Added in v1.1).
- Ignoring admins/superadmins (Config - Added in v1.1)
  
##Planned changes/other additions:##
- None (suggest some? <decicus@gmail.com> or [Issue Tracker](http://git.decicus.com/wordlist-kicker/issues))
  
##Finished changes/other additions:##
- Change opposites (removing words/Steam ID's) to their own functions, for future customizations and better permission-customization for server owners.
- Configuration/settings.

##Command list:##
The format I will use for defining the commands will be like this: console command, eg: ulx addword "word" - chat command, eg: !addword "word" - Default access/permission (user (everyone), admin or superadmin) - Description/Other notes.  
All commands are currently default to SUPERADMIN unless stated otherwise. All commands also run silently unless stated otherwise.  
  
* ulx addword "word" - !addword "word" - Default - Replace "word" with the word you would like to **add** to the blacklist. Cannot add a word that already exists in the blacklist.  
* ulx removeword "word" - !removeword "word" - Default - Replace "word" with the word you like to **remove** from the blacklist. Cannot remove a word that doesn't exist in the blacklist.  
* ulx whitelist *Player* - !whitelist *Player* - Default - Replace *player* with the name of the player (must be connected to the server) to **add the player** to the whitelist. Whitelisted people will not be affected by blacklisted words.  
* ulx unwhitelist *Player* - !unwhitelist *Player* - Default - Replace *player* with the name of the player (must be connected to the server) to **remove the player** from the whitelist.  
* ulx whitelistid *Steam ID* - !whitelistid *Steam ID* - Default - Replace *Steam ID* with the Steam ID of the player you wish to **add** to the whitelist.  
* ulx unwhitelistid *Steam ID* - !unwhitelistid *Steam ID* - Default - Replace *Steam ID* with the Steam ID of the player you wish to **remove** from the whitelist.  

##Configuration settings:##
The format that will be used for describing will be like this: **SettingName** - Parameters (second set of double quotes) - Default - Description  
The settings file can be found inside ServerRootDirectory\\data\\wordlist_kicker\\settings.txt  
The addon folder will contain a default file, please do not touch this.  

* **IgnoreAdmins** - Parameters: "yes"/"no" - Default: "no" - Change to "yes" to whitelist all admins (including superadmins and any other group that inherits from ULX default "admin") from the blacklisted words.  
* **IgnoreSuperadmins** - Parameters: "yes"/"no" - Default: "no" - Change to "yes" to whitelist all superadmins (and any other group that inherits from ULX default "superadmin") from the blacklisted words.
  
##Downloads - Release Archives:##
- [Dropbox](https://www.dropbox.com/sh/tzeevvgh4yt3sif/6vY2b2T0ZF)
- [Google Drive](https://drive.google.com/folderview?id=0B0YQtzHyT_pdV1ZxUE1GOF8tQjA)
- [My website (Decicus.com)](http://decicus.com/wk/)
  
##Changelog:##
- ###Version 1.1 (Requires proper testing - Coming soon):###
	- Added whitelisting of Steam ID's (support for players added).
	- Added a config/settings text file inside the data folder.
  
- ###Version 1.0:###
	- Added adding/removing words.
	- Added kicks (for anyone) if a blacklisted word is found in their name when they join.
	- Also kicks anyone that changes to a name that contains a blacklisted word.