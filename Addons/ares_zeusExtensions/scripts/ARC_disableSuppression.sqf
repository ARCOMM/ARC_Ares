[
	"ARCOMM",
	"Disable Suppression",
	{
		[{
			{
				if (!isPlayer _x) then {
					_x disableAI "SUPPRESSION";
				};
			} forEach allUnits;
		}] call Ares_fnc_BroadcastCode;
	}
] call Ares_fnc_RegisterCustomModule;