[
    "ARCOMM",
    "Apply AI Gear",
    {
        _unitUnderCursor = _this select 1;

        if (!isNull _unitUnderCursor && !isPlayer _unitUnderCursor) then {
            _faction = switch (side _unitUnderCursor) do {
                case west: {"blufor"};
                case east: {"opfor"};
                case resistance: {"indfor"};
                case civilian: {"civilian"};
            };
            
            _hasAIGearSetup = [false,true] select (getNumber (missionConfigFile >> "CfgARCMF" >> "ai" >> "gear" >> _faction >> "enabled"));
            
            if (_hasAIGearSetup) then {
                [
                    [_unitUnderCursor],
                    {
                        params ["_unitUnderCursor"];
                        _unitUnderCursor call ARC_fnc_setupAI;
                    }
                ] remoteExec ["BIS_fnc_call", _unitUnderCursor, false];
            } else {
                [objNull, "AI gear is not enabled in this mission"] call BIS_fnc_showCuratorFeedbackMessage;
            };
        } else {
            [objNull, "Must be placed on an AI unit"] call BIS_fnc_showCuratorFeedbackMessage;
        };
    }
] call Ares_fnc_RegisterCustomModule;
