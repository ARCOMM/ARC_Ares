/*
	Runs a block of code on remote machines in a one-off function. Not suitable for calls that must happen for
	JIP players, but good to execute things on the server or as a one-time operation for everyone connected.

	If this function will be called frequently, consider making a custom function for it so we can only sync the
	code block one time. (e.g. Ares_fnc_AddUnitsToCurator).

	Params:
		0 - Code - The block of code to execute remotely.
		1 - Anything - (Optional) The parameters to pass to the code. Default: [].
		2 - Number - (Optional) 2 if this should run only on the server, 0 if it should be run everywhere (including this machine). Default: 0.
*/

_codeBlock = param [0];
_params = param [1, []];
_runOnAllMachines = param [2, 0, [0]]; // Will run on all machines

Ares_oneshotCodeBlock = _codeBlock;
publicVariable "Ares_oneshotCodeBlock"; // May be redundant but not exactly a waste of space either.

//[_params, "Ares_oneshotCodeBlock", _runOnAllMachines] call BIS_fnc_MP;
_params remoteExecCall ["Ares_oneShotCodeBlock",_runOnAllMachines];

true
