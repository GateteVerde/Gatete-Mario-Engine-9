/// @description Go where the panel takes you

//Set the target room
global.targetroom = destination;

//Change the player's position in map
ds_map_replace(global.worldmap, "playerx", pipex);
ds_map_replace(global.worldmap, "playery", pipey);

//Open map paths after warping
global.clear = 3;
	
//Check star coins
event_user(0);

//Do not remember checkpoint
global.checkpoint = noone;

//If no curtain exists, create it
if (instance_number(obj_curtain_in) == 0) {

	with (instance_create_depth(obj_mapmario.x + 8, obj_mapmario.y + 4, -99, obj_curtain_in))
		target = global.targetroom;
}