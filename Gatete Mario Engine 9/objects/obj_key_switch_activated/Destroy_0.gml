/// @description Destroy semisolid and protect Mario from the horrors of holding nothing

//Inherit the parent event
event_inherited();

//Destroy semisolid
if (mysolid != -1)
	with (mysolid) instance_destroy();