/// @description Default throw / kick event

//Shatter if inside a solid
if (place_meeting(x, y, obj_solid)) {

    //Play 'Bump' sound
    audio_play_sound(snd_bump, 0, false);
    
    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);
    
    //Get 100 points
    with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score)) value = 100;
	
	//Force end kicking on Mario
	if (instance_exists(obj_mario)) {
		
		if (obj_mario.kicking > 0)
			obj_mario.kicking = 0;
	}
    
    //Shatter it
    event_user(0);
}

//Otherwise
else {

    //If 'Up' is pressed, throw it upwards
    if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {
    
        //Play 'Kick' sound
        audio_play_sound(snd_kick, 0, false);
        
        //Create thump
        with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
        
        //If the item is not overlapping a solid
        if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 1, 0)) {
        
            //Set the horizontal speed
            xspeed = obj_mario.xspeed/1.5;
            
            //Boost kick
            y--;
            
            //Set vertical speed
			yspeed = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? -3.5 : -7;
        }
    }
    
    //Otherwise if 'Down' is pressed, leave it on the ground
    else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
        
        //Set the horizontal speed
        xspeed = 0.5*sign(obj_mario.xscale);
    }
    
    //Otherwise, if neither 'Up' or 'Down' is pressed
    else {
        
        //If Mario has horizontal speed
        if (obj_mario.xspeed != 0) {
        
            //Play 'Kick' sound.
            audio_play_sound(snd_kick, 0, false);
    
            //Create thump
            with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
            
            //Kick it
            ready = 1;
            
            //Reset alarms
            alarm[0] = -1;
            alarm[1] = -1;
            image_speed = 1;
            
            //If the player is at the left of the block
            if (obj_mario.x < x)
                xspeed = (2.7+(abs(obj_mario.xspeed)/4));
                
            //Otherwise, if the player is at the right of the block
            else if (obj_mario.x > x)
                xspeed = -(2.7+(abs(obj_mario.xspeed)/4));
                
            //Otherwise, if the player is turning
            else if (obj_mario.turning == 1)            
                xspeed = 2.7*sign(obj_mario.xscale);                        
        }
        
        //Otherwise, leave it on the ground
        else
            xspeed = 0.5*obj_mario.xscale;
    }
	
	//Check if underwater
	swimming = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? true : false;  
}