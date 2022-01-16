/// @description Check if 'Right' is pressed and the player is next to the pipe

//If Mario does not have the 'Mega' powerup
if (global.powerup != cs_mega) {

	//If the 'Right' key is held
	if (input_check(input.right)) 
	|| (gamepad_axis_value(0, gp_axislh) > 0.5) {

	    //If the player does exist
	    if (instance_exists(obj_mario)) {
    
	        //Check for it
	        player = collision_rectangle(x-2, y, x-2, y+32, obj_mario, 0, 0);
        
	        //If the player exists
	        if (player) 
			&& (player.yadd == 0) {
        
	            //Play 'Warp' sound
	            audio_play_sound(snd_warp, 0, false);
        
	            //Create a new warp player object
	            warpme = instance_create_depth(x - 5, y+16, 150, obj_mario_warp);
            
	            //Facing direction
	            warpme.image_xscale = player.xscale;
                        
	            //Colour
	            warpme.isflashing = player.isflashing;
            
	            //Set up direction
	            warpme.direction = 0;
            
	            //Set up destination room
	            if (destination != noone) {
            
	                warpme.destination = destination;
	            }
            
	            //Start warp
				warpme.alarm[0] = 32;
            
	            //Set up warp parameters
	            warpme.exit_dir = exit_dir;
	            warpme.exit_id = exit_id;
            
	            //Destroy the player object
	            with (obj_mario) instance_destroy();
	        }
	    }
	}
}