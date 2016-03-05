[
	"ARCOMM",
	"Apply Gear to Unit",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor && isPlayer _unitUnderCursor) then {
			missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', ""];
			missionNamespace setVariable ["Ares_CopyPaste_Dialog_Result", ""];
			_dialog = createDialog "Ares_CopyPaste_Dialog";
			waitUntil {dialog};
			waitUntil {!dialog};
			_dialogResult = missionNamespace getVariable ["Ares_CopyPaste_Dialog_Result", -1];
			
			if (_dialogResult == 1) then {
				_pastedText = missionNamespace getVariable ["Ares_CopyPaste_Dialog_Text", "r"];
				[[_pastedText, _unitUnderCursor], "f_fnc_assignGear", _unitUnderCursor, false, true] call BIS_fnc_MP;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;