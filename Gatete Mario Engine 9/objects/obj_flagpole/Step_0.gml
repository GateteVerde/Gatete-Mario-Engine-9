/// @description Stop Mario from jumping over the flagpole

//If Mario does exist
if (instance_exists(obj_mario)) {

    //Make sure Mario does not pass through the flag
    if (obj_mario.x > x) {
		
		//Stop if Mario is flying with the cape powerup
		if (instance_exists(obj_fly)) {
		
			obj_fly.x = x;
			if (obj_fly.xspeed > 0)
				obj_fly.xspeed = 0;
		}
    
        //Stop if Mario is dropping down with the cat powerup
        else if (instance_exists(obj_dropdown)) {
        
            obj_dropdown.x = x;
            if (obj_dropdown.xspeed > 0)
                obj_dropdown.xspeed = 0;
        }
        
        //Set player position
        obj_mario.x = x;
        if (obj_mario.xspeed > 0)
            obj_mario.xspeed = 0;
    }
}