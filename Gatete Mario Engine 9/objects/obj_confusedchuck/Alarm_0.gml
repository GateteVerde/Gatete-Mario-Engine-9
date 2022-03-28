/// @description Prepare a ball to later throw it

//Set throwing state
throwing = 1;
    
//If Mario exists
if (instance_exists(obj_mario)) {
    
    //If Mario is above
    if (obj_mario.y < y) {
        
        //Set the jumping sprite
        sprite_index = spr_confusedchuck_jump;
            
        //Animate
        image_speed = 1;
        image_index = 1;
            
        //Boost jump
        y--;
            
        //Set jump state
        jumping = 1;
            
        //Set vertical speed
        if (swimming == 1)
            yspeed = -1.85;
        else
            yspeed = -3.7;
    }     
        
    //Otherwise, animate normally
    else {
        
        //Set default sprite
        sprite_index = spr_confusedchuck;
            
        //Animate
        image_speed = 1;
    }           
}