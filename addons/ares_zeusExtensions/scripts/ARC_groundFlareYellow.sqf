[
	"Flares (Ground)",
	"Yellow Flare (Infinite)",
	{
		_pos = _this select 0;
        "F_40mm_Yellow_Infinite" createVehicle _pos;
	}
] call Ares_fnc_RegisterCustomModule;

[
    "Flares (Ground)",
    "Yellow Flare",
    {
        _pos = _this select 0;
        "F_40mm_Yellow" createVehicle _pos;
    }
] call Ares_fnc_RegisterCustomModule;
