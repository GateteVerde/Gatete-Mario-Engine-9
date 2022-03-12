/// @description Timed Platform logic

//Inherit event from parent
event_inherited();

//Check for the player
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_bottom+4, obj_mario, 1, 0);

//If the player exists
if (mario)
&& (mario.state != playerstate.jump)
&& (mario.bbox_bottom < self.bbox_bottom) {
		    
    //Make the platform move and begin the timer
    if (ready == 0) {
		
		//Set up timer
		time_rst = time;
		
        //Start moving
		ready = 1;
		
		//Begin timer
		alarm[0] = 60;
		
		//Set up direction based on the modifier in position
		if (position_meeting(x + 16, y + 16, obj_down)) {
			
			hspeed = -1;
			vspeed = 1;
		}
		else {
			
			hspeed = 1;
			vspeed = -1;
		}
	}
}