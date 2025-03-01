/// @description Start moving

//Check if moving
moving = 1;
    
//Set the body horizontal scale
for (var i=0; i<4; i++) {
    
    with (mybody[i]) {
		
		//Set vulnerable flag to 2
		vulnerable = 2;
        
		//Face towards Mario
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x)
            xscale = -1;
        else
            xscale = 1;
    }
}
        
//Inherit event
event_inherited();