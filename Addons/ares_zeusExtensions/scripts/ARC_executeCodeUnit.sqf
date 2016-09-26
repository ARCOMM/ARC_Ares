[
	"Util",
	"Execute Code (Unit)",
	{
		_unitUnderCursor = _this select 1;
		
		if (!isNull _unitUnderCursor) then {
			missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', ""];
			missionNamespace setVariable ["Ares_CopyPaste_Dialog_Result", ""];
			_dialog = createDialog "Ares_CopyPaste_Dialog";
			waitUntil {dialog};
			waitUntil {!dialog};
			_dialogResult = missionNamespace getVariable ["Ares_CopyPaste_Dialog_Result", -1];
			
			if (_dialogResult == 1) then {
				_pastedText = missionNamespace getVariable ["Ares_CopyPaste_Dialog_Text", "[]"];
				
				try {
					_compiledText = compile _pastedText;
					[_compiledText, _unitUnderCursor] call Ares_fnc_broadCastCode;
				} catch {
					diag_log _exception;
					["Failed to parse code. See RPT for error."] call Ares_fnc_ShowZeusMessage;
				};
			};
		};		
	}
] call Ares_fnc_RegisterCustomModule;