/*
	Runs a function on all machines currently connected. (Wrapper for BIS_fnc_MP).
	
	Params:
		0 - [Array] - The parameters to pass to the function.
		1 - [String] - The name of the function to call.
		2 - (Optional) [Boolean] - True to execute on all machines, false to execute on server only.
*/

_params = _this select 0;
_functionName = _this select 1;
_isPersistent = param [2, true, [true]];

//[_params, _functionName, true, _isPersistent] spawn BIS_fnc_MP;

_params remoteExecCall [_functionName, 0, _isPersistent];