//FindStartPos.sqf
//by riksuFIN
// Randomize start pos & objective location for spawning

//private [""];

//if !{isServer} exitWith {};


_start_marker_name_start = "Start_pos";		// How start pos markers are named, without number
_objective_marker_start = "Objective_pos";		// Same for objective markers
_startPosMarkerArray = [];
_objectivePosMarkerArray = [];

_nextMarker = "";



_number = 0;
_nextMarker = format ["%1_%2",_start_marker_name_start,_number];


	// Check start pos markers and filter those that exist
while {true} do {
	// Loop and check if they exist
	if !(markerPos "_nextMarker" isEqualTo [0,0,0]) then {
		//debug
		systemChat "_nextMarker";
		_StartPosMarkerArray = _startPosMarkerArray + _nextMarker;
	};
	
		// Once 100 markers have been checked exit the loop and proceed
	if (_number > 100) exitWith {};
	_number = _number + 1;
	_nextMarker = format ["%1_%2",_start_marker_name_start,_number];
};




/*
_number = 0;
_loop = true;
_nextMarker = format ["_objective_marker_start_%1",_number];

while (true) do {
	// Loop and check if 
	if !(markerPos "_nextMarker" isEqualTo [0,0,0]) then {
		_StartPosMarkerArray = _startPosMarkerArray + _nextMarker;
	};
	
		// Once 100 markers have been checked exit the loop and proceed
	if (_number > 100) exitWith {};
	_number = _number + 1;
	_nextMarker = format ["_objective_marker_start_%1",_number];
	
};
*/



hint format ["Markers are sorted, found\n  %1 spawn pos markers\n   %2 objective markers",(count _startPosMarkerArray),(count _objectivePosMarkerArray)];
