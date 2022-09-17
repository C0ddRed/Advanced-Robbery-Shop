# Advanced-Robbery-Shop
Advanced Robbery Shop script for arma 3!
# how to setup 
Add this in Config_Master.hpp [bottom]
#include "Config_Storerobbery.hpp"
Add this in Functions.hpp
class robstore {};
Add this for NPC
this addAction["Rob Gas Station",life_fnc_robstore,"store"];
