/// @description Start moving

//Check if moving
moving = 1;
    
//Set the body horizontal scale
for (i=0; i<4; i++) {
    
    with (mybody[i]) {
        
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x)
            xscale = -1;
        else
            xscale = 1;
    }
}
        
//Inherit event
event_inherited();
