[
	"ARCOMM",
	"CBA Search Nearby",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			_group = group _unitUnderCursor;
			[_group] spawn CBA_fnc_searchNearby;
			[objNull, "Group assigned to search nearby building"] call BIS_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;