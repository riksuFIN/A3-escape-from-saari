// onPlayerKilled.sqf



private ["_oldUnit","_killer"];


_oldUnit = _this select 0;	//Player's body
_killer = _this select 1;	// Killer
_respawnDelay = _this select 3;


sleep _respawnDelay;



// Delete equipment
removeAllWeapons _oldUnit;
removeAllItems _oldUnit;
removeAllAssignedItems _oldUnit;
removeVest _oldUnit;
removeBackpack _oldUnit;
removeHeadgear _oldUnit;
removeGoggles _oldUnit;

_holders = nearestObjects [getPos _oldUnit, ["WeaponHolderSimulated", "GroundWeaponHolder", "Default"], 2];


{deleteVehicle _x} forEach _holders;

