/// @description Turn back into a normal enemy

//If the enemy can turn back
if (turnback != -1) {

    //Create appropiate object
    with (instance_create_depth(x, y, -2, turnback)) {
    
        //If this object is a bomb, hereby timer
        aa = other.aa;
        
        //Create a moving heart if the enemy is big
        if (other.turnback == obj_shyguy_big)
        || (other.turnback == obj_shyguy_big_b) {
			
			//If the safeguard is active
			if (global.safeguard > 0) {
			
	            with (instance_create_depth(x, y, 150, obj_heart_alt)) 
					yspeed = -0.5;
			}
		}
    }
    
    //Destroy
    instance_destroy();
}