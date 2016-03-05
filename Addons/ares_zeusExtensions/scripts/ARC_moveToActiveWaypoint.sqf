[
	"ARCOMM",
	"Move to Active Waypoint",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			if (isPlayer _unitUnderCursor) exitWith {
				[objNull, "Can't place module on a player unit"] call BIS_fnc_showCuratorFeedbackMessage;
			};
			
			_group = group _unitUnderCursor;
			_leader = leader _group;
			_index = currentWaypoint _group;
			_dest = waypointPosition [_group, _index];
			
			{
				[_x, _x] call ace_medical_fnc_treatmentAdvanced_fullHeal;
				[_x] joinSilent grpNull;
				_x setUnitPos "UP";
				_x disableAI "SUPPRESSION";
				_x disableAI "AUTOCOMBAT";
				_x disableAI "FSM";
				_x disableAI "TARGET";
				_x disableAI "AUTOTARGET";
				_x setBehaviour "AWARE";
				_x setSpeedMode "FULL";
				_x doMove _dest;
				
				[_x, _dest, _leader] spawn {
					private _unit = _this select 0;
					private _dest = _this select 1;
					private _leader = _this select 2;
					waitUntil {(_unit distance _dest) < 10};
					_unit enableAI "FSM";
					_unit enableAI "TARGET";
					_unit enableAI "AUTOTARGET";
					_unit setUnitPos "AUTO";
					
					if (_unit == _leader) then {
						_group = createGroup (side _unit);
						[_unit] joinSilent _group;
					} else {
						[_unit] joinSilent (group _leader);
					};
				};
			} forEach units _group;
		};
	}
] call Ares_fnc_RegisterCustomModule;