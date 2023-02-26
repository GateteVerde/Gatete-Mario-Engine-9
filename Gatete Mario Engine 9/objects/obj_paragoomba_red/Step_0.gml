/// @description Red Paragoomba logic

//Inherit event
event_perform_object(obj_physicsparent, ev_step, ev_step_normal);

//Jump when in the ground
if (yadd == 0) {

    //If the paragoomba didn't jumped enough
    if (jumping > 0)
    && (jumping < 4) {
    
        //Increment jumping
        jumping++;
        
        //Set the vertical speed
		yspeed = (swimming) ? -0.75 : -1.5;
		y--;
    }
    
    //Otherwise, if the goomba is about to do a big jump
    else if (jumping == 4) {
    
        //Set the jumping state
        jumping = 5;
        
        //Set the vertical speed
		yspeed = (swimming) ? -2 : -4;
		y--;
    }
    
    //Otherwise
    else if (jumping == 5) {
    
        //Reset jump state
        jumping = 0;
        
        //Move towards the player
        alarm[10] = 10;
    }
}

//Animate the wings
if (jumping > 0) {

    if (jumping > 4)
        anim += 0.3;
    else
        anim += 0.15;
}
else
    anim = 0;