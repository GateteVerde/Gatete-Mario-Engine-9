/// @description Destroy semisolid and protect Mario from the horrors of holding anything

//Inherit the parent event
event_inherited();

//If the semisolid exists
if (instance_exists(mytop))
	with (mytop) instance_destroy();