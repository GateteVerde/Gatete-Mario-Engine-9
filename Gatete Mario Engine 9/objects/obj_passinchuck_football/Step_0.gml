/// @description Football logic

//Inherit event from parent
event_inherited();

//If not jumping
if (yadd == 0) {
    
    //Change frame
    image_index = (image_index == 2) ? 0 : !image_index;
    
    //Manage jumps
    if (jumping < 2) {
        
        //If swimming
        if (swimming)
            yspeed = -2;
        else
            yspeed = -4;
    }
    else {
    
        //If swimming
        if (swimming)
            yspeed = -3;
        else
            yspeed = -6;        
    }
    
    //Boost jump
    y--;
    
    //Manage jumping
    jumping++;
    if (jumping > 2)
        jumping = 0;
}

//Set scale
xscale = ((image_index == 2) || (hspeed == 0)) ? 1 * sign(xspeed) : 1;

//Destroy when outside the view
if (outside_view() == true)
	instance_destroy();