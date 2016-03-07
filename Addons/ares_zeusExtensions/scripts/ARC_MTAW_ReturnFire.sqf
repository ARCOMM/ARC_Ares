[
	"ARCOMM",
	"MTAW Return Fire",
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
				[_x] joinSilent grpNull;
				_grp = group _x;
				_x setUnitPos "UP";
				_x disableAI "SUPPRESSION";
				_x disableAI "AUTOCOMBAT";
				_x setBehaviour "AWARE";
				_x setSpeedMode "FULL";
				_x allowFleeing 0;
				{deleteWaypoint _x} forEach (waypoints _grp);
				
				[_x, _x] call ace_medical_fnc_treatmentAdvanced_fullHeal;
				_x doMove _dest;
			} forEach units _group;
		};
	}
] call Ares_fnc_RegisterCustomModule;