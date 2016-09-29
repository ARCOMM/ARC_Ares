[
    "ARCOMM",
    "Open Spectator (Unit)",
    {
        _unitUnderCursor = _this select 1;

        if (!isNull _unitUnderCursor && {alive _unitUnderCursor} && {isPlayer _unitUnderCursor}) then {
            [_unitUnderCursor, objNull, 1, 1, true] remoteExecCall ["f_fnc_CamInit", _unitUnderCursor];
        };
    }
] call Ares_fnc_RegisterCustomModule;
