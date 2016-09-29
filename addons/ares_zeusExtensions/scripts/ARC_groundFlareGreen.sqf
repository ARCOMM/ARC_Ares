[
    "Flares (Ground)",
    "Green Flare (Infinite)",
    {
        _pos = _this select 0;
        "F_40mm_Green_Infinite" createVehicle _pos;
    }
] call Ares_fnc_RegisterCustomModule;

[
    "Flares (Ground)",
    "Green Flare",
    {
        _pos = _this select 0;
        "F_40mm_Green" createVehicle _pos;
    }
] call Ares_fnc_RegisterCustomModule;
