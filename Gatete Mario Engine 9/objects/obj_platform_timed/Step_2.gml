/// @description Timed Platform logic

//Inherit event from parent
event_inherited();

//Check for the player
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If the player exists
if (mario)
&& (mario.state != playerstate.jump)
&& (mario.bbox_bottom < yprevious+5) {
		    
    //Make the platform move and begin the timer
    if (ready == 0) {
		
		//Set up timer
		time_rst = time;
		
        //Start moving
		ready = 1;
		
		//Begin timer
		alarm[0] = 60;
		
		//Set up direction based on the modifier in position
		if (position_meeting(x, y, obj_up))
			vspeed = -1;
		else if (position_meeting(x, y, obj_down))
			vspeed = 1;
		else if (position_meeting(x, y, obj_left))
			hspeed = -1;
		else
			hspeed = 1;
	}
}