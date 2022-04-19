/// @description Generate a dolphin in the given direction

//If Mario does exist
if (instance_exists(obj_mario)) {

    //If Mario is on the set coordinates
    if (obj_mario.x > xmin) 
    && (obj_mario.x < xmax) 
	&& (!instance_exists(obj_mario_transform)) {
    
        //If the generator generated less than 5 dolphins
        if (spawn < 5) {
    
            //Repeat the process
            alarm[0] = 30;
            
            //Increment spawn
            spawn++;
            
            //Generate a dolphin
			if (dir == 1)
				instance_create_depth(camera_get_view_x(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) + random_range(32, global.gh-32), -2, obj_generatordolphin);
			else
				instance_create_depth(camera_get_view_x(view_camera[0]) + global.gw + 16, camera_get_view_y(view_camera[0]) + random_range(32, global.gh-32), -2, obj_generatordolphin);
        }
        else {
        
            //Reset spawn
            spawn = 0;
            
            //Generate a new batch
            alarm[0] = 120;
        }
    }
    
    //Otherwise, stop.
    else
        alarm[0] = 1;
}

//Otherwise, stop.
else
    alarm[0] = 1;
