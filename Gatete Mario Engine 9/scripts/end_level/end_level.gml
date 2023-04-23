/// @description end_level()

function end_level() {

	//If no fade in object exists
	if (instance_number(obj_fade_in) == 0) {

	    //With the fade object
	    with (instance_create_depth(0, 0, -99, obj_fade_in))
			target = (lives == 0) ? rm_gameover : rm_worldmap;
	}
}