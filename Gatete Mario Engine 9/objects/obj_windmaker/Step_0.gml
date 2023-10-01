/// @description Handle wind

//If Mario does not exist
if (!instance_exists(obj_mario)) {

    //audio_stop_sound(snd_wind);
    ready = 0;
    exit;
}

//Otherwise
else {

    //If the wind is not blowing...
    if (ready == 0) 
	&& (point_in_rectangle(obj_mario.x, obj_mario.y, xmin, 0, xmax, room_height)) {
    
        //...and Mario is inside the given area
        if (obj_mario.x > xmin)
        && (obj_mario.x < xmax) {
        
            //Play 'Wind' sound
            audio_play_sound(snd_wind, 0, true);
            
            //Blow
            ready = 1;
        }
    }
    
    //Otherwise, stop
    else if (ready == 1) {
		
		//If Mario is not longer on the spawn area
		if (!point_in_rectangle(obj_mario.x, obj_mario.y, xmin, 0, xmax, room_height)) {
        
            //Stop 'Wind' sound
            audio_stop_sound(snd_wind);
            
            //Destroy all leaves
            with (obj_leafeff) instance_destroy();
            
            //Stop blowing
            ready = 0;
		}
        
        //Push Mario to the right
        if ((dir == 1) && (!collision_rectangle(obj_mario.bbox_right, obj_mario.bbox_top-4, obj_mario.bbox_right+1, obj_mario.bbox_bottom-1, obj_solid, 0, 0)))
            obj_mario.x += force;
			
		//Otherwise, push Mario to the left
		else if ((dir == -1) && (!collision_rectangle(obj_mario.bbox_left-1, obj_mario.bbox_top-4, obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_solid, 0, 0)))
			obj_mario.x -= force;
    }
}

#region EFFECT
	
	//Generate effect if inside the region
	if (ready) {
	
		repeat (1) {
			
			if (dir == 1) {
				
				part_type_direction(part, -20, 0, 0.05, 0.1);
				part_particles_create(system, camera_get_view_x(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) - 64 + random(round(global.gh) + 128), part, 1);
			}
			else if (dir == -1) {
				
				part_type_direction(part, 180, 200, 0.05, 0.1);
				part_particles_create(system, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) + 16), camera_get_view_y(view_camera[0]) - 64 + random(round(global.gh) + 128), part, 1);
			}
		}
	}		
#endregion