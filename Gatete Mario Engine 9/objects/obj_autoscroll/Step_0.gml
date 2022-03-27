/// @description Autoscroll logic

//Update speed
if (mypath != noone) {
	
	//If Mario has cleared the stage, follow him
	if (instance_exists(obj_mario_clear)) {
	
		x = obj_mario_clear.x;
		y = obj_mario_clear.y;
		camera_set_view_speed(view_camera[0], 4, 4);
	}
	
	//Otherwise
	else {
		
		//If Mario is transforming, stop briefly
		if (instance_exists(obj_mario_transform)) {
		
			//Remember path speed
			if (path_spd == 0) {
				
				path_spd = path_speed;
				path_speed = 0;
			}
		}
		
		//Otherwise, if Mario is not dead
		else if (!instance_exists(obj_mario_dead)) {
		
			if (path_spd != 0) {
			
				path_speed = path_spd;
				path_spd = 0;
			}
			
			//Set the path speed
			path_speed += 0.01;
			if (path_speed > maxspd)
				path_speed -= 0.01;
		}
	}
}

//Airship floating effect
if (airship) {

    airshipoffset += airshipspeed;
    if (airshipoffset > 0)
        airshipspeed -= 0.004;
    else
        airshipspeed += 0.004;
}

//Set wall variables
var wallleft, wallright;

//Wall collision
if (instance_exists(obj_mario)) 
&& (obj_levelcontrol.barrier == true) {

    //Left wall collision.
    if (collision_rectangle(obj_mario.bbox_left-1, obj_mario.bbox_top+4, obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_solid, 1, 0))
    || (collision_rectangle(obj_mario.bbox_left-1, obj_mario.bbox_top+4, obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_solid_moving, 1, 0))
        wallleft = 1;
    else
        wallleft = 0;
    
    //Right wall collision.
    if (collision_rectangle(obj_mario.bbox_right, obj_mario.bbox_top+4, obj_mario.bbox_right+1, obj_mario.bbox_bottom-1, obj_solid, 1, 0))
    || (collision_rectangle(obj_mario.bbox_right, obj_mario.bbox_top+4, obj_mario.bbox_right+1, obj_mario.bbox_bottom-1, obj_solid_moving, 1, 0))
        wallright = 1;
    else
        wallright = 0;
        
    //Prevents Mario from going outside the view.    
    if (obj_mario.x <= camera_get_view_x(view_camera[0]) + 8) {
    
        if (wallright) 
        && (candie == true) {
        
            instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_mario_dead);
            with (obj_mario) instance_destroy();
            exit;
        }
        else {
        
            obj_mario.x = camera_get_view_x(view_camera[0]) + 8;
            if (obj_mario.xspeed < 0)
                obj_mario.xspeed = 0;
        }
    }
    if (obj_mario.x >= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 8) {
    
        if (wallleft) 
        && (candie == true) {
        
            instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_mario_dead);
            with (obj_mario) instance_destroy();
            exit;
        }
        else {
        
            obj_mario.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 8;
            if (obj_mario.xspeed > 0)
                obj_mario.xspeed = 0;
        }
    }
    
    //Kill Mario when below the view
	if (candie == 1)
    && (obj_mario.y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32) {
    
        instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_mario_dead);
        with (obj_mario) instance_destroy();
        exit;
    }
}