/// @description Check if 'Left' is pressed and the player is next to the pipe

//Do not warp if mini is enabled and Mario does not have the tiny powerup
if (mini == true)
&& (global.powerup != cs_tiny)
	exit;

//If Mario does not have the 'Mega' powerup
if (global.powerup != cs_mega) {

	//If the 'Left' key is held
	if (input_check(input.left)) 
	|| (gamepad_axis_value(0, gp_axislh) < -0.5) {

	    //If the player does exist
	    if (instance_exists(obj_mario)) {
    
	        //Check for it
	        player = collision_rectangle(x+18, y, x+18, y+32, obj_mario, 0, 0);
        
	        //If the player exists
	        if (player) 
			&& (player.yadd == 0) {
        
	            //Play 'Warp' sound
	            audio_play_sound(snd_warp, 0, false);
        
	            //Create a new warp player object
	            warpme = instance_create_depth(x + 21, y+16, 150, obj_mario_warp);
            
	            //Facing direction
	            warpme.image_xscale = player.xscale;
                        
	            //Colour
	            warpme.isflashing = player.isflashing;
            
	            //Set up direction
	            warpme.direction = 180;
            
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