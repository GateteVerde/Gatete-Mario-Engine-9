/// @description Check if 'Down' is pressed and the player is above the pipe

//If Mario does not have the 'Mega' powerup
if (global.powerup != cs_mega) {

	//If the 'Down' key is held
	if (input_check(input.down)) 
	|| (gamepad_axis_value(0, gp_axislv) > 0.5) {

	    //If the player does exist
	    if (instance_exists(obj_mario)) {
    
	        //Check for it
	        player = collision_rectangle(x+16, y-2, x+16, y-2, obj_mario, 0, 0);
        
	        //If the player exists
	        if (player) {
        
	            //Play 'Warp' sound
	            audio_play_sound(snd_warp, 0, false);
        
	            //Create a new warp player object
	            warpme = instance_create_depth(x+16, y-16, 150, obj_mario_warp);
            
	            //Facing direction
	            warpme.image_xscale = player.xscale;
                        
	            //Colour
	            warpme.isflashing = player.isflashing;
            
	            //Set up direction
	            warpme.direction = 270;
				
				//Set cannon mode
				warpme.cannon = 1;
				warpme.alarm[2] = 32;
				warpme.alarm[3] = 92;
            
	            //Destroy the player object
	            with (obj_mario) instance_destroy();
	        }
	    }
	}
}