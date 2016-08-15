[
	"Util",
	"Execute Code (HC)",
	{
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
                ARC_oneshotCodeBlock = _compiledText;
                publicVariable "ARC_oneshotCodeBlock";
                {[] remoteExecCall ["ARC_oneshotCodeBlock", _x];false} count ((entities "HeadlessClient_F") select {isPlayer _x});
            } catch {
                diag_log _exception;
                ["Failed to parse code. See RPT for error."] call Ares_fnc_ShowZeusMessage;
            };
        };
	}
] call Ares_fnc_RegisterCustomModule;