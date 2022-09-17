#include "..\..\script_macros.hpp"

/*
    Author: C0ddRedAlazmi
    Cashier 3d: AbdulRahman Saleh
    Description: يسرق البقاله
    license: ممنوع بيع السكريبت بروحه لو مع المشن عادي بس يوكون مو محسوب مع السعر
*/

private ["_config","_cops","_cash","_register","_item","_title","_ui","_progress","_pgText","_pgText","_cP","_i","_getpos","_marker"];
params [["_object",objNull,[objNull]], ["_player",objNull,[objNull]], "", ["_type","",[""]]];

//configs staff
_config = (missionConfigFile >> "storerobberycfg" >> "shops" >> _type);
_cops = getNumber (_config >> "cops");
_cash = getNumber (_config >> "cash");
_register = missionNamespace getVariable getText (_config >> "register");

//some vars
if !(isClass _config) exitWith {hint "chyk 3la al config al9r8hat!"};
if (isNull _object) exitWith {};
if (isNull _player) exitWith {};
if (side _player != civilian) exitWith {hint "You need to be a civilian rob gas station"};
if ((_player distance _object) > 5) exitWith {hint "your too far away"};
if ((west countSide playableUnits) < _cops) exitWith {hint format ["There is %1 Cop online %2 are needed to rob",west countSide playableUnits,_cops]};
if (currentWeapon _player == "") exitWith { hint "hhhhh get weapon first"};
if (_register animationSourcePhase "an_door" != 0) exitWith {hint "The Reigster is open you cant rob this store"};
_object switchMove "AmovPercMstpSsurWnonDnon";

//Setup our progress bar.
_title = "Robbery in Progress stay close 5m to the cashier";
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 3;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];

    _getpos = position player;
    _marker = createMarker ["906", _getpos];
    "906" setMarkerColor "ColorRed";
    "906" setMarkerText "ROBBERY SOTRE !!!";
    "906" setMarkerType "mil_warning";

    if (_cP >= 1) exitWith {};
    if (life_istazed) exitWith {};
    if (life_isknocked) exitWith {};
    if!(alive player) exitWith {hint "gg next time you can do it"};
    if !(isNull objectParent player) exitWith {};
    if (life_interrupted) exitWith {};
};

"progressBar" cutText ["","PLAIN"];

//get floss 

C0ddRed_takemoney = 
{
    private ["_config","_cash","_register"];
    params [["_object",objNull,[objNull]], ["_player",objNull,[objNull]], "", ["_type","",[""]]];
    #include "..\..\script_macros.hpp"
    call compile tostring[32,32,32,32,95,97,99,116,105,111,110,32,61,32,91,95,116,104,105,115,44,50,93,32,99,97,108,108,32,66,73,83,95,102,110,99,95,112,97,114,97,109,59,13,10,13,10,32,32,32,32,95,99,111,110,102,105,103,32,61,32,40,109,105,115,115,105,111,110,67,111,110,102,105,103,70,105,108,101,32,62,62,32,34,115,116,111,114,101,114,111,98,98,101,114,121,99,102,103,34,32,62,62,32,34,115,104,111,112,115,34,32,62,62,32,95,116,121,112,101,41,59,13,10,32,32,32,32,95,99,97,115,104,32,61,32,103,101,116,78,117,109,98,101,114,32,40,95,99,111,110,102,105,103,32,62,62,32,34,99,97,115,104,34,41,59,13,10,32,32,32,32,95,114,101,103,105,115,116,101,114,32,61,32,109,105,115,115,105,111,110,78,97,109,101,115,112,97,99,101,32,103,101,116,86,97,114,105,97,98,108,101,32,103,101,116,84,101,120,116,32,40,95,99,111,110,102,105,103,32,62,62,32,34,114,101,103,105,115,116,101,114,34,41,59,13,10,13,10,32,32,32,32,67,65,83,72,32,61,32,67,65,83,72,32,43,32,95,99,97,115,104,59,13,10,32,32,32,32,104,105,110,116,32,102,111,114,109,97,116,32,91,34,121,111,117,32,103,111,116,32,37,49,36,32,102,114,111,109,32,115,116,111,114,101,32,114,117,110,32,114,105,103,104,116,32,110,111,119,33,34,44,95,99,97,115,104,93,59,13,10,32,32,32,32,95,114,101,103,105,115,116,101,114,32,97,110,105,109,97,116,101,83,111,117,114,99,101,32,91,34,97,110,95,104,105,100,101,34,44,49,93,59,13,10,32,32,32,32,95,114,101,103,105,115,116,101,114,32,114,101,109,111,118,101,65,99,116,105,111,110,32,95,97,99,116,105,111,110,59,13,10];

    C0ddRed_closeregister = {
        private ["_config","_register"];
        params [["_object",objNull,[objNull]], ["_player",objNull,[objNull]], "", ["_type","",[""]]];
        #include "..\..\script_macros.hpp"
        call compile tostring[32,32,32,32,32,32,32,32,105,102,32,40,115,105,100,101,32,95,112,108,97,121,101,114,32,33,61,32,119,101,115,116,41,32,101,120,105,116,87,105,116,104,32,123,104,105,110,116,32,34,89,111,117,32,110,101,101,100,32,116,111,32,98,101,32,97,32,99,111,112,32,116,111,32,99,108,111,115,101,32,114,101,103,105,115,116,101,114,34,125,59,13,10,32,32,32,32,32,32,32,32,95,97,99,116,105,111,110,32,61,32,91,95,116,104,105,115,44,50,93,32,99,97,108,108,32,66,73,83,95,102,110,99,95,112,97,114,97,109,59,13,10,13,10,32,32,32,32,32,32,32,32,95,99,111,110,102,105,103,32,61,32,40,109,105,115,115,105,111,110,67,111,110,102,105,103,70,105,108,101,32,62,62,32,34,115,116,111,114,101,114,111,98,98,101,114,121,99,102,103,34,32,62,62,32,34,115,104,111,112,115,34,32,62,62,32,95,116,121,112,101,41,59,13,10,32,32,32,32,32,32,32,32,95,114,101,103,105,115,116,101,114,32,61,32,109,105,115,115,105,111,110,78,97,109,101,115,112,97,99,101,32,103,101,116,86,97,114,105,97,98,108,101,32,103,101,116,84,101,120,116,32,40,95,99,111,110,102,105,103,32,62,62,32,34,114,101,103,105,115,116,101,114,34,41,59,13,10,32,32,32,32,32,32,32,32,95,114,101,103,105,115,116,101,114,32,97,110,105,109,97,116,101,83,111,117,114,99,101,32,91,34,97,110,95,104,105,100,101,34,44,48,93,59,13,10,32,32,32,32,32,32,32,32,95,114,101,103,105,115,116,101,114,32,97,110,105,109,97,116,101,83,111,117,114,99,101,32,91,34,97,110,95,100,111,111,114,34,44,48,93,59,13,10,32,32,32,32,32,32,32,32,95,114,101,103,105,115,116,101,114,32,114,101,109,111,118,101,65,99,116,105,111,110,32,95,97,99,116,105,111,110,59,13,10];
    };
    call compile tostring[32,32,32,32,95,114,101,103,105,115,116,101,114,32,97,100,100,65,99,116,105,111,110,91,34,67,108,111,115,101,32,82,101,103,105,115,116,101,114,34,44,67,48,100,100,82,101,100,95,99,108,111,115,101,114,101,103,105,115,116,101,114,44,95,116,121,112,101,93,59,13,10];
};

_register animateSource ["an_door",1];
_register addAction["Take Money",C0ddRed_takemoney,_type];
_object switchMove "";
deleteMarker "906";
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;