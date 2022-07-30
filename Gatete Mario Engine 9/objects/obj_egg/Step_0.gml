/// @description Yoshi Egg logic

//Inherit the parent event
event_inherited();

//If not longer in air
if (yadd == 0) {

    //If the egg didn't opened yet, open it
    if (ready == 0) {
		
		//Stop horizontal speed
		xspeed = 0;
    
        //Open it
        ready = 1;
        
        //Set the crack frame
        alarm[0] = 16;        
    }	
}