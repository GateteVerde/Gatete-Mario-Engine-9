/// @description Whistlin' Chuck logic

//Inherit the parent event
event_inherited();

#region LOGIC

	//If not whistlin'
	if (ready == 0) {
    
	    //If the player is within the range
	    if (swimming == true)
	    && (obj_mario.x > bbox_left-32)
	    && (obj_mario.x < bbox_right+32) {
        
	        //Start whistling
	        audio_play_sound(snd_chuck_whistle, 0, false);
            
	        //Wake up all nearby enemies
	        global.whistle = 1;
            
	        //Repeat every 1.5 seconds
	        alarm[0] = 90;
            
	        //Start whistling
	        ready = 1;
            
	        //Set the sprite
	        sprite_index = spr_whistlinchuck;
            
			//Spawn in a super koopa
			if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) {

			    //Choose a side to spawn from
			    var spawn_x = choose(camera_get_view_x(view_camera[0]) - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16);
    
			    //Choose a random Y position to spawn in at
			    var spawn_y = irandom_range(camera_get_view_y(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) -96);
    
			    //Create the koopa
			    instance_create_depth(spawn_x, spawn_y, -2, obj_beachkoopa_super);
			}         
	    }
	}
#endregion

#region ANIMATION

	//Animate if damaged
	if (sprite_index == spr_charginchuck_damage)
	    image_speed = 1;
	else {

	    if (ready == 1)
	        image_speed = 1;
	    else
	        image_speed = 0;
	}
#endregion

//If Mario does not exist or it's at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;