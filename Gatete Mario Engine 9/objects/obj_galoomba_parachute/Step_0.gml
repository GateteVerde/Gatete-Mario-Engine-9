/// @description Parachute Galoomba logic

//Inherit event
event_inherited();

//Begin landing sequence
if (yadd == 0) {

    //Stop horizontal speed
    xspeed = 0;

    //Begin to lower the parachute
    if (ready == 0)
        ready = 1;
    
    //If the parachute is going down
    else if (ready == 1) {
    
        //Keep moving the parachute down
        para_y += 0.5;
        
        //If the parachute is fully behind the paragaloomba, turn into a normal galoomba
        if (para_y > 16) {
                
            //Hide it
            para_y = 16;
            
            //End parachute sequence
            ready = 2;               
            
            //Turn into a galoomba
            alarm[0] = 30;
        }
    }
}
else {

	//Cap vertical speed
	if (yspeed > 0.5)
		yspeed = 0.5;
}