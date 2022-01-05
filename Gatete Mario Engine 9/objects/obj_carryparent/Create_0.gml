/// @description SMB2 Holdable Item parent

//Inherit event from parent
event_inherited();

//This item is held by default
held = 1;

//Number of kills
hitcombo = 0;

//Following object
follow = noone;

//Bounces
bounces = 3;
bounces_max = 3;

//Does this object collide with solids, semisolids or slopes?
allow_collision = false;