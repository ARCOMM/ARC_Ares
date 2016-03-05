[
	"ARCOMM",
	"Fully Heal Unit(s)",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			[_unitUnderCursor, _unitUnderCursor] call ace_medical_fnc_treatmentAdvanced_fullHeal;
		} else {
			_options = [
				["Side:", ["BLUFOR", "OPFOR", "INDFOR"], 0]
			];
			
			_dialogResult = [
				"Fully Heal Units",
				_options
			] call Ares_fnc_ShowChooseDialog;
				
			if (count _dialogResult > 0) then {
				_side = switch ( _options select 0 select 1 select (_dialogResult select 0) ) do {
					case "BLUFOR": {west};
					case "OPFOR": {east};
					case "INDFOR": {resistance};
					default {west};
				};
				
				{
					if (side _x == _side && alive _x) then {
						[_x, _x] call ace_medical_fnc_treatmentAdvanced_fullHeal;
					};
				} forEach allUnits;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;