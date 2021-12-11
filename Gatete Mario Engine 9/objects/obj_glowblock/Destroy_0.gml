/// @description Destroy light and protect Mario from the horrors of holding anything

//Inherit the parent event
event_inherited();

//If the light exists, destroy
if (mylight != -1)
	with (mylight) instance_destroy();