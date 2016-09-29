[
	"Flares (Ground)",
	"White Flare (Infinite)",
	{
		_pos = _this select 0;
        "F_40mm_White_Infinite" createVehicle _pos;
	}
] call Ares_fnc_RegisterCustomModule;

[
    "Flares (Ground)",
    "White Flare",
    {
        _pos = _this select 0;
        "F_40mm_White" createVehicle _pos;
    }
] call Ares_fnc_RegisterCustomModule;
