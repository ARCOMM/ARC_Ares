[
    "ARCOMM",
    "Suppress Nearest",
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
                    [_unit, _target] remoteExecCall ["lookAt", _unit];
                    [_unit, _target] remoteExecCall ["doSuppressiveFire", _unit];
                };
            } forEach (units _group);
        };
    }
] call Ares_fnc_RegisterCustomModule;