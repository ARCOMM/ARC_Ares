[
	"ARCOMM",
	"Cleanup Empty Groups",
	{
        {
            {deleteGroup _x; false} count (allGroups select {(units _x) isEqualTo []});
        } remoteExec ["BIS_fnc_call", 0];
	}
] call Ares_fnc_RegisterCustomModule;
