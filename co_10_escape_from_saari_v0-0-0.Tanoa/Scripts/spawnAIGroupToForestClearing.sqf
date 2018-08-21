//Authored by HyiNamKiitos

/*If clients try to read this file we exit.
This is only for server so that spawned units come to everybody and not just
one guy. Multiplayer server he would be treated high as fuck while shooting "litte green men"*/
if !(isServer) exitWith {};

  /*Need to introduce variables before switch command so that
  the variable scope is full file and not just inside lines of switch. Now this has other
  private variables too, just in case....*/
private [ "_XcoordStart",
          "_XcoordStop",
          "_YcoordStart",
          "_YcoordStop",
          "_randomXcoordinate",
          "_randomYcoordinate",
          "_newGroup",
          "_newLeader",
          "_targetForSpawnedUnits"];


//*** premesis of the spawning area ***
//12300 XcoordStart
//12520 XcoordStop
_XcoordStart = _this select 0;
_XcoordStop = _this select 1;

//3800 YcoordStart
//4050 YcoordStop
_YcoordStart = _this select 2;
_YcoordStop = _this select 3;

/*after units have spawned where they go?
Now im using hidden helipad object what is inside of this spawning area :)*/
_targetForSpawnedUnits = _this select 4;

/*for testing purposes Unit type is hardcoded here, but in final version
units are readed from settings file.*/
_unitsInGroup = ["O_Soldier_GL_F","O_Soldier_F","O_Soldier_lite_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_medic_F"];

//maxium meters between units
_spawnedUnitSpreadValue = 50;

//arrayWithBasicDirections
_direction = ["west","north","east","south"];

//first we randomize the direction for our enemies
_randomDirection = _direction select floor random count _direction;

//Then we give more accurate coordinates based on the direction
switch (_randomDirection) do {

  case "west":
  {
    _randomYcoordinate = floor random [_YcoordStart,_YcoordStop, _YcoordStop];
    //XcoordStart left side of the area
    _randomXcoordinate = _XcoordStart;
    hint format["troops at X:%1,Y:%2",_randomXcoordinate,_randomYcoordinate];
  };
  case "north":
  {
    _randomXcoordinate = floor random [_XcoordStart,_XcoordStop,_XcoordStop];
    //YcoordStart top side of the area
    _randomYcoordinate = _YcoordStart;
  };
  case "east":
  {
    _randomYcoordinate = floor random [_YcoordStart, _YcoordStop,_YcoordStop];
    //XcoordStop rights side of the area
    _randomXcoordinate = _XcoordStop;
  };
  case "south":
  {
    _randomXcoordinate = floor random [_XcoordStart, _XcoordStop,_XcoordStop];
    //YcoordStop under the area
    _randomYcoordinate = _YcoordStop;
  };
  default {
      hint format["At ForestClearing troops are lost :("];
  };

};

//debugging text
hint format["troops at %1,X:%2 Y:%3",_randomDirection,_randomXcoordinate,_randomYcoordinate];

//this part of file does actual unit spawning
_newGroup = createGroup [east,true];

//Leader of the group is different type unit than rest
_unKnownPosition = createMarker ["Marker1", [_randomXcoordinate,_randomYcoordinate]];
//_unKnownPosition = createMarker ["Marker1", position player];

//_unksSpawnPosition setMarkerPos [_randomXcoordinate,_randomYcoordinate];
_newLeader = "O_Soldier_SL_F" createUnit [getMarkerPos _unKnownPosition,_newGroup,"newLeader = this"];

sleep 1;

//Here is rest of the group created...
{
  _newUnit = _x createUnit [getMarkerPos _unKnownPosition,_newGroup,"newUnit = this"];
  sleep .4;
}forEach _unitsInGroup;

/*This last function compines all the values what we have discripted,
units spawned and heading to they're targets direction with combat style*/

_object = missionNamespace getVariable [_targetForSpawnedUnits, objNull];
//
_wp = _newGroup addWaypoint [position [12380,3937], 0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "COMBAT";

{
_x doMove (position _object);
} foreach units _newGroup;
//works also without foreach with only one line "_wp doMove (getPos _object);"

hint format["valamis!"];
