/*onPlayerRespawn.sqf

Executed by: Automaticly when player respawns

Do respawn related stuff

*/

private ["_oldUnit","_newUnit","_respawn","_respawnDelay"];


_newUnit = _this select 0;			// Reference to new player's unit
_oldUnit = _this select 1;			// Reference to player's body
_respawn = _this select 2;			// Respawn type (3)
_respawnDelay = _this select 3;



_newUnit setUnitLoadout (player getVariable ["Saved_Loadout",true]);	// Apply loadout player had on death (saved in onPlayerKilled.sqf)





	//debug
//hint format ["respawned!\n%1\n%2\n%3\n%4",_oldUnit,_newUnit,_respawn,_respawnDelay];