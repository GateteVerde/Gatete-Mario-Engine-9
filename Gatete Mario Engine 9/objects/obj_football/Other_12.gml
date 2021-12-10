/// @description Custom throw / kick event

//Mark as kicked
kicked = true;

//If 'Up' is pressed, throw it upwards
if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {

    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);
    
    //Create thump
    with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
        
    //Set vertical speed based if it is underwater or not
	yspeed = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? -3.5 : -7;
	
	//Set the horizontal speed
    xspeed = obj_mario.xspeed/1.5;
}

//Otherwise, if neither 'Up' or 'Down' is pressed
else {
                
    //Play 'Kick' sound.
    audio_play_sound(snd_kick, 0, false);
    
    //Create thump
    with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
            
    //Set vertical speed based if it is underwater or not
	yspeed = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? -1 : -2;
            
	//Set horizontal speed
    xspeed = 2.7*sign(obj_mario.xscale);
}

//If the object is underwater, begin swim
swimming = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? true : false;