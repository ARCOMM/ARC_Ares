#include "\ares_zeusExtensions\module_header.hpp"

_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

_doesGroupContainAnyPlayer = false;
{
	if (isPlayer _x) exitWith { _doesGroupContainAnyPlayer = true; };
} forEach (units _groupUnderCursor);

if (_doesGroupContainAnyPlayer) then
{
	[objnull, "Cannot garrison groups containing playable units."] call bis_fnc_showCuratorFeedbackMessage;
}
else
{
    _groupUnderCursor setSpeedMode "FULL";
	[(getPos _logic), (units _groupUnderCursor), 150, true, true] call Ares_fnc_ZenOccupyHouse;
	[objnull, "Garrisoned nearest building."] call bis_fnc_showCuratorFeedbackMessage;
};

#include "\ares_zeusExtensions\module_footer.hpp"
