[
	"ARCOMM",
	"Positional ACRE",
	{
		_options = [
			["Status:", ["Enabled", "Disabled"]]
		];
		
		_dialogResult = [
			"Positional ACRE",
			_options
		] call Ares_fnc_ShowChooseDialog;
			
		if (count _dialogResult > 0) then {
			_bool = switch ( _options select 0 select 1 select (_dialogResult select 0) ) do {
				case "Enabled": {true};
				case "Disabled": {false};
				default {false};
			};
			
			[_bool] call acre_api_fnc_setSpectator;
		};
	}
] call Ares_fnc_RegisterCustomModule;