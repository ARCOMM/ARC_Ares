[
    "ARCOMM",
    "End Briefing Stage",
    {
        ARC_briefingTimeEnd = true;
        publicVariable "ARC_briefingTimeEnd";
    }
] call Ares_fnc_RegisterCustomModule;

[
    "ARCOMM",
    "Start Briefing Stage",
    {
        [] remoteExecCall ["f_fnc_safeStartLoop", 2];
    }
] call Ares_fnc_RegisterCustomModule;
