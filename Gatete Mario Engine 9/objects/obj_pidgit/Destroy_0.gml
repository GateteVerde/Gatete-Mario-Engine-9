/// @description Destroy semisolid and leave a rideable carpet in place

//Inherit the parent event
event_inherited();

//Create a carpet (Will be coded later)
carpet = instance_create_depth(x, y - 2, -2, obj_lakitu_cloud);
with (carpet)
	sprite_index = spr_pidgit_carpet;