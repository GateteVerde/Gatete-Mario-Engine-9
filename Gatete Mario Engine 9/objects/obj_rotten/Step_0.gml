/// @description Rotten Mushroom logic

//Inherit the parent event
event_inherited();

//Keep charging at Mario
if (charge == 1) {

    //If there's no gravity
    if (yadd == 0) {
    
        //If Mario is not under the effects of the starman
        if (!instance_exists(obj_invincibility)) {
            
            //Follow Mario
            if (!instance_exists(obj_mario))
            || (obj_mario.x < x) {
            
                xspeed -= 0.075;
                if (xspeed < -1)
                    xspeed = -1;
            }
            else {
            
                xspeed += 0.075;
                if (xspeed > 1)
                    xspeed = 1;
            }
        }
        
        //Otherwise
        else {
            
            //Un-follow Mario
            if (!instance_exists(obj_mario))
            || (obj_mario.x < x) {
            
                xspeed += 0.075;
                if (xspeed > 1)
                    xspeed = 1;
            }
            else {
            
                xspeed -= 0.075;
                if (xspeed < -1)
                    xspeed = -1;
            }                    
        }
    }
    
    //Change scale
    if (ready == 0) {
    
        fakexsc += 0.025;
        fakeysc -= 0.025;
        if (fakexsc > 1.25)
            ready = 1;
    }
    else if (ready == 1) {
    
        fakexsc -= 0.025;
        fakeysc += 0.025;
        if (fakexsc < 0.75)
            ready = 0;
    }
}
