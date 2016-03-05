[
	"ARCOMM",
	"Disable Auto Combat",
	{
		[{
			{
				if (!isPlayer _x) then {
					_x disableAI "AUTOCOMBAT";
				};
			} forEach allUnits;
		}] call Ares_fnc_BroadcastCode;
	}
] call Ares_fnc_RegisterCustomModule;