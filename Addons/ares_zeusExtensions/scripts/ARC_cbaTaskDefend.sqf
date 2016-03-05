[
	"ARCOMM",
	"CBA Task Defend",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			_group = group _unitUnderCursor;
			
			_options = [
				["Radius:", ["50","100","150","200","250","300","350","400","450","500"], 2],
				["Building Size Threshold:", ["1","2","3","4","5","6","7","8","9","10"], 1],
				["Can Patrol:", ["Yes","No"], 0]
			];
			
			_dialogResult = [
				"Defend Area",
				_options
			] call Ares_fnc_ShowChooseDialog;
			
			if (count _dialogResult > 0) then {
				_radius = parseNumber(_options select 0 select 1 select (_dialogResult select 0));
				_buildingThreshold = parseNumber(_options select 1 select 1 select (_dialogResult select 1));
				_canPatrol = if ( parseNumber(_options select 2 select 1 select (_dialogResult select 2)) == 0) then {true} else {false};
				
				[_group, _group, _radius, _buildingThreshold, _canPatrol] call CBA_fnc_taskDefend;
				[objNull, "Group assigned to defend area"] call BIS_fnc_showCuratorFeedbackMessage;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;