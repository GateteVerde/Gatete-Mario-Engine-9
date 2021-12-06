/// @description end_level()

function end_level() {

	//If no fade in object exists
	if (instance_number(obj_fade_in) == 0) {

	    //With the fade object
	    with (instance_create_depth(0, 0, -99, obj_fade_in)) {
    
	        //If lives are set to 0, go to the game over screen.
	        if (lives == 0)
	            target = rm_gameover;
            
	        //Otherwise, go to the map.
	        else
	            target = rm_course_w1_l1;
	    }
	}
	
	//Reset globals (TO BE MOVED)
	reset_globals(false);
}