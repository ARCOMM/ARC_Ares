/*
	Creates a new logic unit with a specified name.
	
	Parameters:
		0 - 3D position - position of the logic.
		1 - String (Optional) - Logic Name
		2 - Group (Optional) - The group to add the logic to.
*/

_position = param [0];
_name = param [1, "Logic"];
_group = param [2, grpNull];

if (isNull _group) then
{
	_center = createCenter sideLogic;
	_group = createGroup _center;
};
_logic = _group createUnit ["LOGIC", _position, [], 0, "NONE"];
_logic setName _name;
_logic;