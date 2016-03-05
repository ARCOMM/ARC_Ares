[
	"ARCOMM",
	"Destroy Objects (5m)",
	{
		{ _x setDamage 1; } forEach nearestObjects [(_this select 0), [], 5];
	}
] call Ares_fnc_RegisterCustomModule;