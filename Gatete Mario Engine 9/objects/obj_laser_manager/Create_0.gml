/// @description Laser Manager

//Check if ready
ready = 0;

//Repeat as many times needed
repeat (2048) {

    //If there's not ground in position, keep moving
    if (!collision_point(x-8, y+16, obj_semisolid, 0, 0)) 
	&& (!collision_point(x-8, y+16, obj_slopeparent, 1, 0)) {
    
        x -= 16;
        y += 16;
    }
    
    //Otherwise, the laser is ready
    else
        ready = 1;
}