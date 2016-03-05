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
			_index = currentWaypoint _group;
			_dest = waypointPosition [_group, _index];
			
			{
				_x setUnitPos "UP";
				_x disableAI "SUPPRESSION";
				_x disableAI "AUTOCOMBAT";
				_x disableAI "FSM";
				_x disableAI "TARGET";
				_x disableAI "AUTOTARGET";
				_x doMove _dest;
				
				[_x, _dest] spawn {
					waitUntil {((_this select 0) distance (_this select 1)) < 20};
					(_this select 0) enableAI "FSM";
					(_this select 0) enableAI "TARGET";
					(_this select 0) enableAI "AUTOTARGET";
					(_this select 0) setUnitPos "AUTO";
				};
			} forEach units _group;
		};
	}
] call Ares_fnc_RegisterCustomModule;