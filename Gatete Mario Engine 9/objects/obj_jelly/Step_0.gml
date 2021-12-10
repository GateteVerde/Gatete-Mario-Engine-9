/// @description Mushroom Jelly logic

//If the player is on this platform
if (collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
&& (obj_mario.bbox_bottom < yprevious+5)
&& (obj_mario.state < playerstate.jump) {
	
	//Start wiggling
	if (ready != 1) then ready = 1;

    //Make Mario bounce
    with (obj_mario) {

        //Set the vertical speed
        yspeed = -4.125;
        
        //Boost jump
        y--;
        
        //Switch to jump state
        state = playerstate.jump;
		
		//Play 'Trampoline' sound
		audio_play_sound(snd_trampoline, 0, false);
        
        //Check if the 'Jump' key is pressed.
        if (input_check(input.action_0))
            jumping = 1;
        else
            jumping = 2;
    }
}

//Depth
#region DEPTH

	if (xscale > 1)
		depth = -2;
	else
		depth = -1;
#endregion

//Scale
#region SCALE

	//If bouncing on
	if (ready == 1) {
		
		xscale = lerp(xscale, 1.5, 0.3);
		yscale = lerp(yscale, 0.5, 0.3);
		if (xscale > 1.49) {
		
			ready = 0;
			xscale = 1.5;
			yscale = 0.5;
		}
	}
	
	//If returning to normal
	else {
		
		xscale = lerp(xscale, 1, 0.15);
		yscale = lerp(yscale, 1, 0.15);
	}
#endregion

//Arrow collision
if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_up, 0, 0))
    vspeed -= 0.0324;
else if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_down, 0, 0))
    vspeed += 0.0324;
else if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_left, 0, 0))
    hspeed -= 0.0324;
else if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_right, 0, 0))
    hspeed += 0.0324;