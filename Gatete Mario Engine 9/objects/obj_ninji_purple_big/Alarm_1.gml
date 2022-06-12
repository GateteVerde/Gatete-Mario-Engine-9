/// @description Start jumping

//If the ninji is not jumping
if (jumping == 0) {

    //If Mario does exists
    if (instance_exists(obj_mario)) {
        
        //If Mario is nearby
        if ((obj_mario.x > x-32) && (obj_mario.x < x+32))
			yspeed = (swimming) ? -2 : -4;
		else
			yspeed = (swimming) ? -1 : -2;
    }
    
    //Boost jump
    y--;
    
    //Jump
    jumping = 1;
	
	//Set jumping sprite
	image_speed = 0;
	image_index = 1;
}
