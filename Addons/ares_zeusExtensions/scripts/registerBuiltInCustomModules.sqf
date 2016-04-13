_scripts = [
	"Arsenal_AddArsenal",
	"Arsenal_AddArsenalAmmo",
	"Arsenal_AddFullArsenal",
	"Arsenal_CopyToClipboard",
	"Arsenal_PasteFromClipboard",
	"Behaviour_ArtilleryFire",
	"Behaviour_ArtilleryFireMission",
	"Equipment_RemoveWeaponOptics",
	"SaveLoad_CreateMissionSQF",
	"Util_ChangePlayerSides",
	"Util_DisableDebugLog",
	"Util_DisableSimulation",
	"Util_EnableDebugLog",
	"Util_EnableSimulation",
	"Util_ExecuteCodeAll",
	"Util_ExecuteCodeLocal",
	"Util_ExecuteCodeServer",
	"Util_MakeZeusInvisible",
	"Util_MakeZeusVisible",
	"Util_RemoveAllActions",
	"ARC_aceFullyHeal",
	"ARC_addTrackingMarker",
	"ARC_cbaTaskDefend",
	"ARC_cbaSearchArea",
	"ARC_cbaSearchNearby",
	"ARC_destroyObjects",
	"ARC_disableAutoCombat",
	"ARC_disableSuppression",
	"ARC_godMode",
	"ARC_MTAW_ReturnFire",
	"ARC_MTAW_IgnoreCombat",
	"ARC_executeCodeUnit",
	"ARC_positionalACRE",
	"ARC_applyGear",
    "ARC_applyAIGear",
	"ARC_huntNearestPlayer",
	"ARC_explodeUnitSmall",
	"ARC_explodeUnitMedium",
	"ARC_explodeUnitLarge"
];

{
	call compile preprocessFileLineNumbers ("\ares_zeusExtensions\scripts\" + _x + ".sqf");
} forEach _scripts;

// We need this to be registered so that the artillery modules can use it to
// fire artillery where it is local.
if (isNil "Ares_FireArtilleryFunction") then
{
	Ares_FireArtilleryFunction = {
		_artilleryUnit = _this select 0;
		_targetPos = _this select 1;
		_ammoType = _this select 2;
		_roundsToFire = _this select 3;
		enableEngineArtillery true;
		_artilleryUnit commandArtilleryFire [_targetPos, _ammoType, _roundsToFire];
	};
	publicVariable "Ares_FireArtilleryFunction";
};

