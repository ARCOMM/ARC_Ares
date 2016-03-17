/*
	Function to check if HC present in mission.
	by tryteyker
	rev1.0
	Parameters:
	None
	Returns:
	True if there is a headless client, else false
*/

private ["_headlessEntities","_return"];
_headlessEntities = entities "HeadlessClient_F";
_return = false;
if !(count _headlessEntities == 0) then {_return = true} else {_return = false};
_return 