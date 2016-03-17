[
	"ARCOMM",
	"Hunt Nearest Player",
	{
		_unitUnderCursor = _this select 1;
		if !([] call Ares_fnc_checkHeadlessEntities) exitWith {[objNull, "No headless client initialized!"] call BIS_fnc_showCuratorFeedbackMessage};
		if (isNull _unitUnderCursor) then {
			_options = [
				["Hunter Side:", ["BLUFOR", "OPFOR", "INDFOR", "CIVILIAN"], 1],
				["Aggro Distance (meters):", ["250", "500", "750", "1000", "1250", "1500", "1750", "2000"], 2],
				["Update Delay (seconds):", ["5", "10", "15", "20", "25", "30"], 2]
			];
			
			_dialogResult = [
				"Hunt Nearest Player",
				_options
			] call Ares_fnc_ShowChooseDialog;
				
			if (count _dialogResult > 0) then {
				_aggroDistance = parseNumber (_options select 1 select 1 select (_dialogResult select 1));
				_updateDelay = parseNumber (_options select 2 select 1 select (_dialogResult select 2));
				_hunterSide = switch (_options select 0 select 1 select (_dialogResult select 0)) do {
					case "BLUFOR": {west};
					case "OPFOR": {east};
					case "INDFOR": {resistance};
					case "CIVILIAN": {civilian};
					default {east};
				};
				
				[_hunterSide, _aggroDistance, _updateDelay] spawn {
					private _hunterSide = _this select 0;
					private _aggroDistance = _this select 1;
					private _updateDelay = _this select 2;
					
					while {true} do {
						{
							_unit = _x;
							if (!isPlayer _unit && (side _unit) == _hunterSide) then {
								_group = group _unit;
								_isHandled = _unit getVariable ["ARC_aiHandled", false];
								
								if (!_isHandled) then {
									[_unit] joinSilent grpNull;
									_unit setUnitPos "UP";
									_unit disableAI "SUPPRESSION";
									_unit disableAI "AUTOCOMBAT";
									_unit setBehaviour "AWARE";
									_unit setSpeedMode "FULL";
									_unit allowFleeing 0;
									{deleteWaypoint _x} forEach (waypoints _group);
								};
								
								_unit setVariable ["ARC_aiHandled", true, true];
								_nTargets = _unit nearEntities ["CAManBase", _aggroDistance];
								_closestTarget = objNull;
								_closestFloat = 5000;

								{
									_target = _x;
									if (side _target != east && alive _target && !(_target getVariable ["ACE_isUnconscious", false])) then {
										_distanceToTarget = _target distance _unit;
										if (_distanceToTarget < _closestFloat) then {
											_closestTarget = _target;
											_closestFloat = _distanceToTarget;
										};
									};
								} forEach _nTargets;
								
								_targetPos = getPos _closestTarget;
								
								if (([_closestTarget] call ace_common_fnc_isInBuilding) && (_unit distance _closestTarget) < 15) then {
									{deleteWaypoint _x} forEach (waypoints _group);
									_wp = _group addWaypoint [_targetPos, 0];
									_wp setWaypointSpeed "FULL";
									_wp setWaypointType "SAD";
									_wp setWaypointBehaviour "AWARE";
									_wp setWaypointCombatMode "GREEN";
								} else {
									_unit doMove _targetPos;
								};
							};
						} forEach allUnits;
						
						sleep _updateDelay;
					};
				};
			};
		} else {
			_options = [
				["Aggro Distance (meters):", ["250", "500", "750", "1000", "1250", "1500", "1750", "2000"], 2],
				["Update Delay (seconds):", ["5", "10", "15", "20", "25", "30"], 2]
			];
			
			_dialogResult = [
				"Hunt Nearest Player",
				_options
			] call Ares_fnc_ShowChooseDialog;
				
			if (count _dialogResult > 0) then {
				_aggroDistance = parseNumber (_options select 0 select 1 select (_dialogResult select 0));
				_updateDelay = parseNumber (_options select 1 select 1 select (_dialogResult select 1));
				
				[_unitUnderCursor, _aggroDistance, _updateDelay] spawn {
					private _unitUnderCursor = _this select 0;
					private _group = group _unitUnderCursor;
					private _aggroDistance = _this select 1;
					private _updateDelay = _this select 2;
					private _useUnits = [];
					
					{
						[_x] joinSilent grpNull;
						_useUnits pushBack _x;
					} forEach units _group;
					
					while {true} do {
						{
							private _unit = _x;
							
							if (!isPlayer _unit) then {
								_isHandled = _unit getVariable ["ARC_aiHandled", false];
								
								if (!_isHandled) then {
									[_unit] joinSilent grpNull;
									_unit setUnitPos "UP";
									_unit disableAI "SUPPRESSION";
									_unit disableAI "AUTOCOMBAT";
									_unit setBehaviour "AWARE";
									_unit setSpeedMode "FULL";
									_unit allowFleeing 0;
									{deleteWaypoint _x} forEach (waypoints _group);
								};
								
								_unit setVariable ["ARC_aiHandled", true, true];
								_nTargets = _unit nearEntities ["CAManBase", _aggroDistance];
								_closestTarget = objNull;
								_closestFloat = 5000;

								{
									_target = _x;
									if (side _target != east && alive _target && !(_target getVariable ["ACE_isUnconscious", false])) then {
										_distanceToTarget = _target distance _unit;
										if (_distanceToTarget < _closestFloat) then {
											_closestTarget = _target;
											_closestFloat = _distanceToTarget;
										};
									};
								} forEach _nTargets;
								
								_targetPos = getPos _closestTarget;
								
								if (([_closestTarget] call ace_common_fnc_isInBuilding) && (_unit distance _closestTarget) < 15) then {
									{deleteWaypoint _x} forEach (waypoints _group);
									_wp = _group addWaypoint [_targetPos, 0];
									_wp setWaypointSpeed "FULL";
									_wp setWaypointType "SAD";
									_wp setWaypointBehaviour "AWARE";
									_wp setWaypointCombatMode "GREEN";
								} else {
									_unit doMove _targetPos;
								};
							};
						} forEach _useUnits;
						
						sleep _updateDelay;
					};
				};
			};			
		};
	}
] call Ares_fnc_RegisterCustomModule;