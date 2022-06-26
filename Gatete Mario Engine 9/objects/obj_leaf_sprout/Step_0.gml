/// @description Leaf logic

//If not frozen
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//If the leaf is sprouting out from the block.
if ((action = "sprout") && (y < ystart-36)) {

    //Set the new action.
    action = "nright";
    alarm[0] = 5;

    //Set the vertical speed.
    yspeed = 0;
    yadd = 0;
}

//Otherwise, if the leaf is floating to the right.
else if (action = "right") {

    //Set the frame.
    image_index = 0;
    
    //Change direction
    if (x > xstart+16) {
    
        xspeed -= 0.0625;
        yspeed -= 0.06;
    }
    else {
    
        xspeed += 0.06;
        yspeed -= 0.08;
    }
    
    //Set the new action
    if (x > xstart+32) {
    
        //Set the new action.
        action = "nleft";
        alarm[0] = 5;
        
        //Set the horizontal speed.
        xspeed = 0;
    }
}

//Otherwise, if the leaf is floating to the left.
else if (action = "left") {

    //Set the frame.
    image_index = 1;
    
    //Change direction
    if (x < xstart+16) {
    
        xspeed += 0.0625;
        yspeed -= 0.06;
    }
    else {
    
        xspeed -= 0.06;
        yspeed -= 0.08;
    }
    
    //Set the new action
    if (x < xstart) {
    
        //Set the new action.
        action = "nright";
        alarm[0] = 5;
        
        //Set the horizontal speed.
        xspeed = 0;
    }
}

//Change depth
if (action != "sprout")
	depth = -2;