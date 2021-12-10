/// @description If the item is not being held

//Manage movement
x += xspeed;
y += yspeed;
yspeed += yadd;

//If not held
if (held == 0) {
	
	//Animate
	image_speed = 1;

    //Set the gravity when not underwater
    if (!swimming) {
    
        //Gravity
        yadd = 0.2;
        
        //Cap vertical speed
        if (yspeed > 4)
            yspeed = 4;
    }
    
    //Otherwise, set the gravity when underwater
    else {
    
        //Gravity
        yadd = 0.05;
        
        //Cap vertical speed
        if (yspeed > 1)
            yspeed = 1;
    }
    
    //Check for a water object
    var water = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_swim,0,0);
    
    //If the object is not underwater and makes contact with water
    if (water) && (!swimming) {
    
        //Make the object go underwater
        swimming = true;
        
        //Stop vertical movement
        if (yspeed > 0)
            yspeed = 0;
    }
    
    //Otherwise, if the object is underwater and it's not underwater, end swimming.
    else if (!water) && (swimming)    
        swimming = false;
}

//Destroy if outside the view
if ((held == 0) && (outside_view())) {
	
	if (y < camera_get_view_y(view_camera[0]))
	exit;
		instance_destroy();
}