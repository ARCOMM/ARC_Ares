[
	"ARCOMM",
	"Resupply Magazines",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			if (isPlayer _unitUnderCursor) exitWith {
				[objNull, "Can't place module on a player unit"] call BIS_fnc_showCuratorFeedbackMessage;
			};
			
			_weapon = currentWeapon _unitUnderCursor;
			_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
			_magazineClass = if (count _magazines > 0) then {(_magazines select (_magazineClass min (count _magazines - 1)))} else {""};
			
			if (isClass (configFile >> "CfgMagazines" >> _magazineClass)) then {
				for "_i" from 1 to 8 do {
					_unitUnderCursor addMagazine _magazineClass;
				};
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;