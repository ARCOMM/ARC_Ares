[
	"ARCOMM",
	"Delete Corpses (400m)",
	{
        private _isNearPlayers = {
            params [["_unit", objNull]];
            
            if (isNull _unit) exitWith {false};
            
            private _nearUnits = _unit nearEntities ["Man", 400];
            _nearUnits = _nearUnits select {isPlayer _x && {alive _x}};
            
            !(_nearUnits isEqualTo [])
        };
        
        {
            deleteVehicle _x;
            false
        } count ((entities "CAManBase") select {
            !alive _x &&
            {!([_x] call _isNearPlayers)}
        });
	}
] call Ares_fnc_RegisterCustomModule;

[
    "ARCOMM",
    "Delete Corpses (200m)",
    {
        private _isNearPlayers = {
            params [["_unit", objNull]];
            
            if (isNull _unit) exitWith {false};
            
            private _nearUnits = _unit nearEntities ["Man", 200];
            _nearUnits = _nearUnits select {isPlayer _x && {alive _x}};
            
            !(_nearUnits isEqualTo [])
        };
        
        {
            deleteVehicle _x;
            false
        } count ((entities "CAManBase") select {
            !alive _x &&
            {!([_x] call _isNearPlayers)}
        });
    }
] call Ares_fnc_RegisterCustomModule;
