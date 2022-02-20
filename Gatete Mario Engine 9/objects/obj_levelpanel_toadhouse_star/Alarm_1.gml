/// @description Go where the panel takes you

//Set the target room
global.targetroom = destination;

//Set chest items
global.prize[0] = choose(cs_starman, cs_gold, cs_pwing, cs_3up);
global.prize[1] = -1;
global.prize[2] = -1;

//If the level is not the same as the previous level
if (global.level != levelid) {

	//Check for collected star coins in the previous world
	for (var i = 0; i < 3; i++) {
    
		//If the star coin has not been saved
		if (ds_map_find_value(global.sc[i], global.level) < 3)
		    ds_map_replace(global.sc[i], global.level, 0);
	}
}

//Do not remember checkpoint
global.checkpoint = noone;

//Remember the player last position in map
with (obj_mapmario) event_user(0);

//If no curtain exists
if (instance_number(obj_curtain_in) == 0) {

	with (instance_create_depth(obj_mapmario.x + 8, obj_mapmario.y + 4, -99, obj_curtain_in))
		target = global.targetroom;
}