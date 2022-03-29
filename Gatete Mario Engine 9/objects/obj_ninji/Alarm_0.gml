/// @description Jump

//If the ninji is not jumping
if (jumping == 0) {

    //Do not animate
    image_speed = 0;
    image_index = 1;
    
    //Switch jump
    switch (jump) {
    
        //Low jump
        default: {
        
			//Set vert
			yspeed = (swimming) ? -1.75 : -3.5;
        } break;
        
        //Medium jump
        case (2): {
        
			//Set vertical speed
			yspeed = (swimming) ? -2.25 : -4.5;                
        } break;
        
        //High jump
        case (3): {
        
			//Set vertical speed
			yspeed = (swimming) ? -2.75 : -5.25;                   
        } break;
    }
    
    //Boost jump
    y--;    
    
    //Set jump state
    jumping = 1;    
    
    //Increment jump
    jump++;
    if (jump > 3)
        jump = 0;
}