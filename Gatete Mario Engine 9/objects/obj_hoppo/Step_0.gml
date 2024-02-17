/// @description Hoppo logic

//Previous horizontal speed
prevxspeed = xspeed;

//Inherit the parent event
event_inherited();

//If rolling
if (ready == 1) {
	
	//Angle
	angle += (freeze == false) ? -10 * xscale : 0;

	//If the direction changes...
	if (sign(xspeed) != sign(prevxspeed)) {

	    //If the item is not outside, play 'Bump' sound
	    if (outside_view() == false) then audio_play_sound(snd_bump, 0, false);
		
		//Jump only if not falling
		if (yspeed == 0) {
			
			//Jump a bit
			yspeed = -1.5;
			y--;
		}
    
	    //Create shell thump
		with (instance_create_depth(x+(24*sign(prevxspeed)), y + 8, -6, obj_shellthump)) bump = true;
	}
}

//Set the facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;