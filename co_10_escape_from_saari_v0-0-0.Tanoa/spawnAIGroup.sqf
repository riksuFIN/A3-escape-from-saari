if !(isServer) exitWith {};

_spawnPoints = ["AISpawnMarker_1","AISpawnMarker_2","AISpawnMarker_3"];
_unitsInGroup = ["O_Soldier_GL_F","O_Soldier_F","O_Soldier_lite_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_medic_F"];

_spawnMarker = _spawnpoints select (floor random (count _spawnpoints));

_unksSpawnPosition = getMarkerPos _spawnMarker; //[x,y,z]
//hint format ["Position %1",_unksSpawnPosition select [0,2]];
newGroup = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_unksSpawnPosition,newGroup,"newLeader = this"];
sleep 1;

{
    _newUnit = _x createUnit [_unksSpawnPosition,newGroup,"newUnit = this"];
    sleep .4;
}forEach _unitsInGroup;

[newGroup,getPos helipad,50] call BIS_fnc_taskPatrol;
sleep 4;
newGroup setBehaviour "COMBAT";
