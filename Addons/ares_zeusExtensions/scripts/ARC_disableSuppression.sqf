[
	"ARCOMM",
	"Disable Suppression",
	{
		[{
			{
				if (!isPlayer _x) then {
					_x disableAI "SUPPRESSION";
				};
                false
			} count allUnits;
		}] call Ares_fnc_BroadcastCode;
	}
] call Ares_fnc_RegisterCustomModule;