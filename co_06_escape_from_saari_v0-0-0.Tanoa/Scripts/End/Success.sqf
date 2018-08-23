// Success.sqf
// by riksuFIN
// Activated by: trigger (in editor, when all players of group have left playable area)
// Completes mission


// TBD

	// Count number of players still alive
_units_Alive = {alive _x} count units playerSquad;	// Count number of players alive
if (_units_Alive >= 1 ) then {

	//Mission success code here
	
	hint "You have escaped!";
	systemChat "You have left the island of terror behind!";

	
	
	
	
	
	
} else {
	if (count allPlayers >1) then {	// Checks if there are more than 1 player connected, if true make mission fail when everyone is dead, else let lone survivor respawn
	
	// Insert all players dead -code here
	
	hint "Everyone is dead, mission fail!";
	
	
	
	} else {
		// For debug
		hint "Everyone is dead, but there is only one player so mission will go on. Good luck, One Man Army!";
	};
};









