[
    "ARCOMM",
    "Rush Nearest",
    {
        _unitUnderCursor = _this select 1;

        if (!isNull _unitUnderCursor && {!isPlayer _unitUnderCursor}) then {
            private _group = group _unitUnderCursor;

            {
                private _unit = _x;
                private _nearUnits = _unit nearEntities ["Man", 1000];

                _nearUnits = _nearUnits select {isPlayer _x && {alive _x}};
                _nearUnits apply {[(_x distance _unit), _x]};
                _nearUnits sort true;

                private _target = _nearUnits param [0, objNull];

                if (!isNull _target) then {
                    [_unit, "AWARE"] remoteExecCall ["setBehaviour", _unit];
                    [_unit, "FULL"] remoteExecCall ["setSpeedMode", _unit];
                    [_unit, "UP"] remoteExecCall ["setUnitPos", _unit];
                    [_unit, 0] remoteExecCall ["allowFleeing", _unit];
                    [_unit, getPos _target] remoteExecCall ["doMove", _unit];
                };
            } forEach (units _group);
        };
    }
] call Ares_fnc_RegisterCustomModule;