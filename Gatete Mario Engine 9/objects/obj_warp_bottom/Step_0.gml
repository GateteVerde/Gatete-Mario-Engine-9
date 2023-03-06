/// @description Check if 'Up' is pressed and the player is above the pipe

//Do not warp if mini is enabled and Mario does not have the tiny powerup
if (mini == true)
&& (global.powerup != cs_tiny)
	exit;

//If Mario does not have the 'Mega' powerup
if (global.powerup != cs_mega) {

	//If the 'Up' key is held
	if (input_check(input.up)) 
	|| (gamepad_axis_value(0, gp_axislv) < -0.5) {

	    //If the player does exist
	    if (instance_exists(obj_mario)) 
		&& (!instance_exists(obj_mario_transform)) {
    
	        //Check for it
	        player = collision_rectangle(x+16, y+18, x+16, y+18, obj_mario, 0, 0);
        
	        //If the player exists
	        if (player) {
        
	            //Play 'Warp' sound
	            audio_play_sound(snd_warp, 0, false);
        
	            //Create a new warp player object
	            warpme = instance_create_depth(obj_mario.x, y+16, 150, obj_mario_warp);
            
	            //Facing direction
	            warpme.image_xscale = player.xscale;
                        
	            //Colour
	            warpme.isflashing = player.isflashing;
				
				//Pipe Type
				warpme.pipetype = pipetype;
            
	            //Set up direction
	            warpme.direction = 90;
            
	            //Set up destination room
	            if (destination != noone) {
            
	                warpme.destination = destination;
	            }
            
	            //Start warp
				#region
				
					//Start warp
					warpme.alarm[0] = 32;
				
					//If Mario is tiny
					if (global.powerup == cs_tiny) {
						
						warpme.y -= 8;
						warpme.alarm[2] = 8;
					}
					
					//Otherwise, if Mario is small
					else if (global.powerup == cs_small)				
						warpme.alarm[2] = 16;
						
					//Otherwise, if Mario is big or it's riding a Yoshi
					else if ((global.powerup > cs_small) || (global.mount > 0))					
						warpme.y += 16;
					
				#endregion
            
	            //Set up warp parameters
	            warpme.exit_dir = exit_dir;
	            warpme.exit_id = exit_id;
            
	            //Destroy the player object
	            with (obj_mario) instance_destroy();
	        }
	    }
	}
}