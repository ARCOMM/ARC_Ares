[
	"Flares (Ground)",
	"Red Flare (Infinite)",
	{
		_pos = _this select 0;
        "F_40mm_Red_Infinite" createVehicle _pos;
	}
] call Ares_fnc_RegisterCustomModule;

[
    "Flares (Ground)",
    "Red Flare",
    {
        _pos = _this select 0;
        "F_40mm_Red" createVehicle _pos;
    }
] call Ares_fnc_RegisterCustomModule;
