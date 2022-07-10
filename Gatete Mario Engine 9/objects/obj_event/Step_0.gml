/// @description If the specified key is pressed

//If Mario does exist
if (instance_exists(obj_mario)) {
    
    //Check for it
    mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0);
        
    //If Mario exists
    if (mario)
    && (mario.state != playerstate.jump)
    && (mario.state != playerstate.climb) {

		if (ready == 0)
		&& (input_check_pressed(mykey)) {
	
			//Trigger
			ready = 1;

			//Trigger the event
			if (tline != noone) {
	
				//Set the time
				timeline_index = tline;
		
				//If the timeline is not running
				if (timeline_running == 0) {
			
					timeline_position = 0;
					timeline_running = 1;
				}
			}
		}
	}
}