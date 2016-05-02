[
	"ARCOMM",
	"Explosion (Small/82mm)",
	{
		_pos = _this select 0;
		_pos set [2, 0.5];
		_shell = createVehicle ["Sh_82mm_AMOS", _pos, [], 0, "NONE"];
		_shell setVelocity [0,0,-1];
	}
] call Ares_fnc_RegisterCustomModule;
