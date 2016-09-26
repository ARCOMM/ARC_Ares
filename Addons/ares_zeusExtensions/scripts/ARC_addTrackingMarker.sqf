[
	"ARCOMM",
	"Add Tracking Marker",
	{
		_unitUnderCursor = _this select 1;

		if (!isNull _unitUnderCursor) then {
			_options = [
				["Delay (minutes):", ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]],
				["Accuracy (meters):", ["0", "25", "50", "75", "100", "125", "150", "175", "200"]],
				["Shape:", ["ICON","RECTANGLE","ELLIPSE"]],
				["Brush:", ["Solid","SolidFull","Horizontal","Vertical","Grid","FDiagonal","BDiagonal","DiagGrid","Cross","Border","SolidBorder"]],
				["Type:", ["Dot","Objective","Destroy","Flag","Warning"]],
				["Colour:", ["Red","Blue","Green","Yellow","Orange","Black","Pink"]],
				["Opacity:", ["0","0.5","1"], 2],
				["Size:", ["Very Small","Small","Medium","Large","Very Large"]]
			];
			
			_dialogResult = [
				"Configure Tracking Marker for Unit",
				_options
			] call Ares_fnc_ShowChooseDialog;
				
			if (count _dialogResult > 0) then {
				_type = switch ( _options select 4 select 1 select (_dialogResult select 4) ) do {
					case "Dot": {"mil_dot"};
					case "Objective": {"mil_objective"};
					case "Destroy": {"mil_destroy"};
					case "Flag": {"mil_flag"};
					case "Warning": {"mil_warning"};
					default {"mil_dot"};
				};
				
				_size = switch ( _options select 7 select 1 select (_dialogResult select 7) ) do {
					case "Very Small": {[50,50]};
					case "Small": {[100,100]};
					case "Medium": {[150,150]};
					case "Large": {[200,200]};
					case "Very Large": {[250,250]};
					default {[150,150]};
				};
				
				if ( _options select 2 select 1 select (_dialogResult select 2)  == "ICON") then { _size = [1,1]; };
				
				_params = [
					_unitUnderCursor,
					parseNumber(_options select 0 select 1 select (_dialogResult select 0)) * 60,
					parseNumber(_options select 1 select 1 select (_dialogResult select 1)),
					[
						_options select 2 select 1 select (_dialogResult select 2),
						_options select 3 select 1 select (_dialogResult select 3),
						_type,
						(format ["Color%1", (_options select 5 select 1 select (_dialogResult select 5))]),
						parseNumber(_options select 6 select 1 select (_dialogResult select 6)),
						"",
						_size
					]
				];
				
				//[_params, "ARC_fnc_addTrackingMarker", false] call BIS_fnc_MP;
				_params remoteExecCall ["ARC_fnc_addTrackingMarker", 2];
				[objNull, "Added tracking marker to unit"] call BIS_fnc_showCuratorFeedbackMessage;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;