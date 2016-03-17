[
	"ARCOMM",
	"MTAW Ignore Combat",
	{
		_unitUnderCursor = _this select 1;
		if !([] call Ares_fnc_checkHeadlessEntities) exitWith {[objNull, "No headless client initialized!"] call BIS_fnc_showCuratorFeedbackMessage};
		if (!isNull _unitUnderCursor) then {
			if (isPlayer _unitUnderCursor) exitWith {
				[objNull, "Can't place module on a player unit"] call BIS_fnc_showCuratorFeedbackMessage;
			};
			
			_group = group _unitUnderCursor;
			_index = currentWaypoint _group;
			_dest = waypointPosition [_group, _index];
			
			{
				[_x] joinSilent grpNull;
				_grp = group _x;
				_x setUnitPos "UP";
				_x disableAI "SUPPRESSION";
				_x disableAI "AUTOCOMBAT";
				_x disableAI "TARGET";
				_x disableAI "AUTOTARGET";
				_x setBehaviour "AWARE";
				_x setSpeedMode "FULL";
				_x allowFleeing 0;
				{deleteWaypoint _x} forEach (waypoints _grp);
				
				[_x, _x] call ace_medical_fnc_treatmentAdvanced_fullHeal;
				_x doMove _dest;
				
				[_x, _dest] spawn {
					waitUntil {((_this select 0) distance (_this select 1)) < 15};
					(_this select 0) enableAI "TARGET";
					(_this select 0) enableAI "AUTOTARGET";
				};
			} forEach units _group;
		};
	}
] call Ares_fnc_RegisterCustomModule;