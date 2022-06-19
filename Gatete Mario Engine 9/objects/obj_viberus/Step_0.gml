/// @description Viberus logic

//Inherit event
event_inherited();

//If the gladrus is angry
if (charge == 1) {

    //Previous hspeed
    prevxspeed = xspeed;
    
    //If the direction changed, speed up
    if (xspeed != prevxspeed) then xspeed = sign(xspeed)*1.5;
        
    //Keep charging at Mario
    if (charge == 1) {
    
        //If there's no gravity
        if (yadd == 0) {
            
            //Follow Mario
            if (!instance_exists(obj_mario))
            || (obj_mario.x < x) {
            
                xspeed -= 0.0324;
                if (xspeed < -1.5)
                    xspeed = -1.5;
            }
            else {
            
                xspeed += 0.0324;
                if (xspeed > 1.5)
                    xspeed = 1.5;
            }
        }
    }
    
    //Face towards Mario
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}

//Otherwise, face towards direction
else {

    //Handle squish animation
    if (squishy == 1) {
    
        //Return to normal
        fxs -= 0.05;
        fys += 0.05;
    
        //Start charging at Mario
        if (fxs <= 1) && (fys >= 1) {
			
			//Set the sprite
            sprite_index = spr_viberus_mad;
        
            //End squish
            squishy = 2;
            
            //Begin to charge
            charge = 1;
            
            //Animate
			image_speed = 1;
        }
    }
    
    //Face towards Mario
    if (xspeed > 0)
        xscale = 1;
    else if (xspeed < 0)
        xscale = -1;
}