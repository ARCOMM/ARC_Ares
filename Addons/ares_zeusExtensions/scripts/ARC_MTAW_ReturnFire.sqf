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
			
			[{
				private _group = _this select 0;
				private _dest = _this select 1;
				
				{
					[_x, _x] call ace_medical_fnc_treatmentAdvanced_fullHeal;
					_x setUnitPos "UP";
					_x disableAI "SUPPRESSION";
					_x disableAI "AUTOCOMBAT";
					_x enableAI "TARGET";
					_x enableAI "AUTOTARGET";
					_x setBehaviour "AWARE";
					_x setSpeedMode "FULL";
					_x allowFleeing 0;
					_x doMove _dest;
					
					[_x, _dest] spawn {
						private _unit = _this select 0;
						private _dest = _this select 1;
						waitUntil {(_unit distance _dest) < 10};
						_unit enableAI "TARGET";
						_unit enableAI "AUTOTARGET";
						_unit setUnitPos "AUTO";
					};
				} forEach units _group;
			}, [_group, _dest], true] call Ares_fnc_BroadcastCode;
		};
	}
] call Ares_fnc_RegisterCustomModule;