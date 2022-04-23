/// @description Jump towards the player

//Set the horizontal speed
xspeed = parent.prevxspeed;
xscale = 1*sign(parent.prevxspeed)

//If the player is above.
if (jump_type == 0) {

    //Set the vertical speed.
    yspeed = -3.2;
    
    //Jump
    jumping = 1;
}

//Otherwise, if it's below or in the same y position.
else if (jump_type != 0) {

    //Set the vertical speed.
    yspeed = -1.75;
    
    //Jump
    jumping = 1;
    
    //Otherwise, if it's below.
    if (jump_type == 2) {
    
        //Check for nearby solid areas and allow jumping.
        mysolid = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,1);
        if (mysolid) 
        && (mysolid.image_yscale <= 1)
            ready = 1;
    }
}
