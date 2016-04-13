[
    "ARCOMM",
    "CBA Search Area",
    {
        _unitUnderCursor = _this select 1;

        if (!isNull _unitUnderCursor) then {
            _group = group _unitUnderCursor;
            _leader = leader _group;
            
            _mrkName = format ["ARC_CBA_taskSearchArea_%1_%2", (groupId _group), (str time)];
            _marker = createMarker [_mrkName, (getPos _leader)];
            
            [
                [_group, _mrkName],
                {
                    params ["_group","_mrkName"];
                    [_group, _mrkName, "AWARE", "NO CHANGE", "FULL"] call CBA_fnc_taskSearchArea;
                }
            ] remoteExec ["BIS_fnc_call", (groupOwner _group), false];
            
            [objNull, "Group assigned to search area"] call BIS_fnc_showCuratorFeedbackMessage;
        };
    }
] call Ares_fnc_RegisterCustomModule;