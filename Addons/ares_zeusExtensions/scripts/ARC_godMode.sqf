[
	"ARCOMM",
	"God Mode",
	{
		_unitUnderCursor = _this select 1;

		_applyGodMode = {
			_unit = _this select 0;
			_bool = _this select 1;
			_boolStr = if (_bool) then {"Disabled"} else {"Enabled"};
			_unit allowDamage _bool;
			_unit setVariable ["ARC_allowDamage", _bool, true];
			
			if (!_bool) then {
				_respawnEvent = _unit addEventHandler ["Respawn", {
					(_this select 0) allowDamage ((_this select 0) getVariable ["ARC_allowDamage", true]);
				}];
				
				_unit setVariable ["ARC_event_allowDamage", _respawnEvent, true];
			} else {
				_unit removeEventHandler ["Respawn", (_unit getVariable ["ARC_event_allowDamage", 0])];
			};
		};

		if (!isNull _unitUnderCursor) then {
			_options = [
				["Status:", ["Enabled", "Disabled"], 0]
			];
			
			_dialogResult = [
				"God Mode",
				_options
			] call Ares_fnc_ShowChooseDialog;
			
			if (count _dialogResult > 0) then {
				_status = switch ( _options select 0 select 1 select (_dialogResult select 0) ) do {
					case "Enabled": {false};
					case "Disabled": {true};
					default {true};
				};
				
				[_unitUnderCursor, _status] call _applyGodMode;
			};
		} else {
			_options = [
				["Status:", ["Enabled", "Disabled"], 0],
				["Side:", ["BLUFOR", "OPFOR", "INDFOR"], 0]
			];
			
			_dialogResult = [
				"God Mode",
				_options
			] call Ares_fnc_ShowChooseDialog;
				
			if (count _dialogResult > 0) then {
				_status = switch ( _options select 0 select 1 select (_dialogResult select 0) ) do {
					case "Enabled": {false};
					case "Disabled": {true};
					default {true};
				};
				
				_side = switch ( _options select 1 select 1 select (_dialogResult select 1) ) do {
					case "BLUFOR": {west};
					case "OPFOR": {east};
					case "INDFOR": {resistance};
					default {west};
				};
				
				{
					if (side _x == _side && alive _x) then {
						[_x, _status] call _applyGodMode;
					};
                    false
				} count allUnits;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;