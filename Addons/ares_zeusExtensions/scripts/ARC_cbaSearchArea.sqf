[
	"ARCOMM",
	"CBA Search Area",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			_group = group _unitUnderCursor;
			_leader = leader _group;
			
			_mrkName = format ["ARC_CBA_taskSearchArea_%1", groupId _group];
			_marker = createMarker [_mrkName, (getPos _leader)];
			
			[_group, _mrkName, "AWARE", "NO CHANGE", "FULL"] call CBA_fnc_taskSearchArea;
			[objNull, "Group assigned to search area"] call BIS_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;