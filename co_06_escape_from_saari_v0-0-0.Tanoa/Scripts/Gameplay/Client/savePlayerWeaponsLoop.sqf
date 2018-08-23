/*  savePlayerWeaponsLoop.sqf
By riksuFIN
Executed from:initPlayerLocal.sqf
Saves player's weapons every now and then
*/




// Loop for entire time player is in mission
while {true} do {

	sleep 120;	// We don't want to repeat loop every tick, do we? 2 mins sounds better, right?

	if (alive player) then {	//Only do if player is alive
		
		player setVariable ["Saved_Loadout",getUnitLoadout player];	// Save player's loadout (to be used when respawning)
		
		if (debug) then {
		systemChat "Loadout saved";
		};
		
		
		
	};

};