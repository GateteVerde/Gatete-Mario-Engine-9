/// @description Mudball logic

//Inherit event from parent
event_inherited();

//If not jumping
if (yadd == 0) {
    
    //Boost jump
    y--;
    
    //If swimming
    if (swimming)
        yspeed = -1;
    else
        yspeed = -2;
}

//Destroy when outside the view
if (outside_view() == true)
	instance_destroy();