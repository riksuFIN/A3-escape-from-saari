//FindStartPos.sqf
//by riksuFIN
// Randomize start pos & objective location for spawning

private ["_start_marker_name_start","_objective_marker_start","_startPosMarkerArray","_objectivePosMarkerArray","_nextMarker","_number","_rand","_startType"];

//if !{isServer} exitWith {};


_start_marker_name_start = "Start_pos";		// How start pos markers are named, without number
_objective_marker_start = "Objective_pos";		// Same for objective markers
_startPosMarkerArray = [];
_objectivePosMarkerArray = [];

_nextMarker = "";



_number = 0;

	// Check start pos markers and filter those that exist
while {true} do {
	// Loop and check if they exist

	_nextMarker = format ["%1_%2",_start_marker_name_start,_number];
	
	if !(markerPos _nextMarker isEqualTo [0,0,0]) then {
		//debug
		//systemChat format ["%1",_nextMarker];
		_startPosMarkerArray pushBack _nextMarker;
	};
	
		// Once 100 markers have been checked exit the loop and proceed
	if (_number > 100) exitWith {systemChat format ["%1",_number]};
	_number = _number + 1;
};



_number = 0;
	// Check objective pos markers and filter those that exist
while {true} do {
	// Loop and check if they exist

	_nextMarker = format ["%1_%2",_objective_marker_start,_number];
	
	if !(markerPos _nextMarker isEqualTo [0,0,0]) then {
		//debug
		//systemChat format ["%1",_nextMarker];
		_objectivePosMarkerArray pushBack _nextMarker;
	};
	
		// Once 100 markers have been checked exit the loop and proceed
	if (_number > 100) exitWith {systemChat format ["%1",_number]};
	_number = _number + 1;
};



diag_log format ["Markers are sorted, found %1 spawn pos markers %2 objective markers",(count _startPosMarkerArray),(count _objectivePosMarkerArray)];
if (debug) then {
	systemChat format ["Markers are sorted, found %1 spawn pos markers %2 objective markers",(count _startPosMarkerArray),(count _objectivePosMarkerArray)];
};


_startType = ["startType",0] call BIS_fnc_getParamValue;

_rand = random 100;

	// Pick between randomly generated location and pre-defined locations
		// Note: StartType = parameter, 0: Both, 1: pre-placed, 2: Random
if ((_rand > 50 && _startType != 1 ) || _startType == 2 ) then {
// Generate random position
	
	diag_log "Selected random location";
	if (debug) then {
	systemChat "Selected random location";
	};

	// Exec script to find random pos & spawn generic thing there
	null = execVM "Scripts\Prepare\SpawnRandomStartPos.sqf";

} else {
	// Find position from pre-defined locations
	diag_log "Selected pre-placed location";
	if (debug) then {
	systemChat "Selected pre-placed location";
	};
	
	
	
	
};

