/// @description Door logic

//If the 'Up' key is pressed
if ((input_check_pressed(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) 
&& (image_speed == 0)
&& (image_index == 0) 
&& (lock == 0) 
&& (global.powerup != cs_mega) {

    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //Check for it
        mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0);
        
        //If Mario exists
        if (mario)
        && (mario.state != playerstate.jump)
        && (mario.state != playerstate.climb) {
			
			//If this is a fake door, make boos appear
			if (boo == true) {
				
				//Play 'Boo' sound
				audio_play_sound(snd_boo, 0, false);
				
				//Create smoke
				with (instance_create_depth(x + 8, y, -2, obj_smoke)) {
				
					image_xscale = 1.5;
					image_yscale = 1.5;
					image_blend = make_colour_rgb(200, 191, 231);
				}
				
				//Create boos
				with (instance_create_depth(x + 8, y - 8, -4, obj_door_boo)) motion_set(45, 1.5);
				with (instance_create_depth(x + 8, y - 8, -4, obj_door_boo)) motion_set(135, 1.5);
				with (instance_create_depth(x + 8, y - 8, -4, obj_door_boo)) motion_set(225, 1.5);
				with (instance_create_depth(x + 8, y - 8, -4, obj_door_boo)) motion_set(315, 1.5);
				
				//Destroy
				instance_destroy();
			}
			
			//Otherwise
			else {
        
	            //Play 'Door' sound
	            audio_play_sound(snd_door, 0, false);
            
	            //Animate the door
	            image_speed = 1;
            
	            //Create a new mario object
	            warpme = instance_create_depth(mario.x, mario.y, -5, obj_mario_door);
            
	            //Facing direction
	            warpme.image_xscale = mario.xscale;
            
	            //Colour
	            warpme.isflashing = mario.isflashing;
                        
	            //Set up destination room
	            if (destination != noone) {
            
	                warpme.destination = destination;
	            }
            
	            //Set up door id
	            warpme.my_door = id;
            
	            //Set up warp parameters
	            warpme.exit_id = exit_id;
            
	            //Destroy mario object
	            with (obj_mario) instance_destroy();
			}
        }
    }
}