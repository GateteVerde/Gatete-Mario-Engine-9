/// @description Autoscroll logic

//Update speed
if (speed > 0) {
	
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
			if (prevspd == 0) {
				
				prevspd = speed;
				speed = 0;
			}
		}
		
		//Otherwise, if Mario is not dead
		else if (!instance_exists(obj_mario_dead)) {
		
			if (prevspd != 0) {
			
				speed = prevspd;
				prevspd = 0;
			}
			
			//Set the path speed
			speed += 0.01;
			if (speed > maxspd)
				speed -= 0.01;
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

    //Left wall collision
	wallleft = (collision_rectangle(obj_mario.bbox_left-1, obj_mario.bbox_top+4, obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_solid, 1, 0)) ? 1 : 0;
    
    //Right wall collision
    wallright = (collision_rectangle(obj_mario.bbox_right, obj_mario.bbox_top+4, obj_mario.bbox_right+1, obj_mario.bbox_bottom-1, obj_solid, 1, 0)) ? 1 : 0;
        
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

//Modifier collision
if (collision_rectangle(x, y, x+15, y+15, obj_up, 0, 0))
	direction = 90;
else if (collision_rectangle(x, y, x+15, y+15, obj_down, 0, 0))
	direction = 270;
else if (collision_rectangle(x, y, x+15, y+15, obj_left, 0, 0))
	direction = 180;
else if (collision_rectangle(x, y, x+15, y+15, obj_right, 0, 0))
	direction = 0;