[
	"ARCOMM",
	"Suicide Bomber (Large/155mm)",
	{
		_unitUnderCursor = _this select 1;
		_leaderpos = [getposATL _unitUnderCursor select 0, getposATL _unitUnderCursor select 1, 0.5];
		// Create a shell @ leaderpos
		_shell = createVehicle ["Sh_155mm_AMOS", _leaderpos, [], 0, "NONE"];
		// Velocity to make sure there's a ground impact - some shells don't explode otherwise
		_shell setVelocity [0,0,-1];
	}
] call Ares_fnc_RegisterCustomModule;
