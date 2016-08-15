[
	"ARCOMM",
	"Cleanup Empty Groups",
	{
        {_x remoteExecCall ["deleteGroup", _x];false} count (allGroups select {count units _x == 0});
	}
] call Ares_fnc_RegisterCustomModule;