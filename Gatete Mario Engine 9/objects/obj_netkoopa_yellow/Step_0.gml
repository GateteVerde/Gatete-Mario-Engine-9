///Net koopa logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Keep charging at Mario
if (charge == 1) {
        
    //Follow Mario horizontally
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x) {
    
        xspeed -= 0.0524;
        if (xspeed < -1.8)
            xspeed = -1.8;
    }
    else {
    
        xspeed += 0.0524;
        if (xspeed > 1.8)
            xspeed = 1.8;
    }
    
    //Follow Mario vertically
    if (!instance_exists(obj_mario))
    || (obj_mario.y < y) {
    
        yspeed -= 0.0524;
        if (yspeed < -1.8)
            yspeed = -1.8;
    }
    else {
    
        yspeed += 0.0524;
        if (yspeed > 1.8)
            yspeed = 1.8;
    }
}

//Set animation speed
image_speed = 1;

//If there's not a climbing spot to the left
if ((xspeed < 0) && (!position_meeting(bbox_left-1, y+8, obj_climb)))
    xspeed = 1.5;

//Otherwise, if there's not a climbing spot to the right
if ((xspeed > 0) && (!position_meeting(bbox_right+1, y+8, obj_climb)))
    xspeed = -1.5;

//Otherwise, if there's not a climbing spot to the top
if ((yspeed < 0) && (!position_meeting(x+8, bbox_top-1, obj_climb)))
    yspeed = 1.5;

//Otherwise, if there's not a climbing spot to the bottom
if ((yspeed > 0) && (!position_meeting(x+8, bbox_bottom+1, obj_climb)))
    yspeed = -1.5;
