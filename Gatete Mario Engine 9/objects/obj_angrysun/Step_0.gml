/// @description Angry sun logic

//If the angry sun is waiting...
if (ready == 0) {

    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If Mario reached the point where the sun will attack
        if (obj_mario.x > xmin) {
        
            //Animate
            image_speed = 1;
            
            //Went nut
            ready = 1;
			
			//Set vulnerabilities
			vulnerable = 2;
			stomp = 2;
            
            //Create movement object
            movement = instance_create_layer(0, 0, "Main", obj_angrysun_movement);
        }
    }
}

//Otherwise, if the sun went nuts.
else {

    //If the movement object exists
    if (instance_exists(movement)) {
    
        x = round(camera_get_view_x(view_camera[0]))+movement.x;
        y = round(camera_get_view_y(view_camera[0]))+movement.y;
    }
}
