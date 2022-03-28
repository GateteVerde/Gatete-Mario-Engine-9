/// @description Allow jump or jump when the player is not nearby

//If the chuck hp is full
if (hp == 2) {

    //If the chuck is not jumping
    if (jumping == 0) {
    
        //If there's no gravity
        if (yadd == 0) {
        
            //Set vertical speed
            yspeed = -2;
            
            //Boost jump
            y--;
        }
        
        //Repeat the process
        alarm[0] = 90;
    }
    else if (jumping == 3) {
    
        jumping = 0;
        alarm[0] = 15;
    }
}
else
    event_inherited();