[
	"ARCOMM",
	"Delete AI Corpses",
	{
		_options = [
			["Side:", ["BLUFOR", "OPFOR", "INDFOR"], 0]
		];

		_dialogResult = [
			"Delete AI Corpses",
			_options
		] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult > 0) then {
			_side = switch ( _options select 0 select 1 select (_dialogResult select 0) ) do {
				case "BLUFOR": {west};
				case "OPFOR": {east};
				case "INDFOR": {resistance};
				default {sideUnknown};
			};
			
			if (_side == sideUnknown) exitWith {};
			
			_side spawn {
				{
					if (side _x == _this && !alive _x && !isPlayer _x) then {
						_units = _x nearEntities ["Man", 250];
						if ({isPlayer _x && alive _x} count _units <= 0) then {
							deleteVehicle _x;
						};
					};
					
					false
				} count allUnits;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;