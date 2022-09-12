/// @description Start moving only when inside the view

//If the object is outside the view
if (outside_view() == true) {

    alarm[0] = 2;
    exit;
}

//Otherwise, check what kind of movement does this block have
else {

    //If the block cannot move back and forth
    if (backnforth == false) {
    
		//Move towards Mario
        if (!instance_exists(obj_mario))
			hspeed = -1;
        else if (obj_mario.x < x+8)
            hspeed = -1;
        else
            hspeed = 1;
    }
    else {
    
        //Allow moving back and forth
        ready = 1;
    
        //Move towards Mario
        if (!instance_exists(obj_mario))
            dir = -1;
		else if (obj_mario.x < x+8)
			dir = -1;
        else
            dir = 1;
    }
    
    //Set the vertical speed.
    vspeed = 0.5;    
}
