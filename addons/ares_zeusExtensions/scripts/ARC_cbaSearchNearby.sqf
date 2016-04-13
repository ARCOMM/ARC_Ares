[
	"ARCOMM",
	"CBA Search Nearby",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			_group = group _unitUnderCursor;
            
            [
                [_group],
                {
                    params ["_group"];
                    [_group] spawn CBA_fnc_searchNearby;
                }
            ] remoteExec ["BIS_fnc_call", (groupOwner _group), false];
            
			[objNull, "Group assigned to search nearby building"] call BIS_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;