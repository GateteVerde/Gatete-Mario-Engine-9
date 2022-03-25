/// @description Start moving

//If Mario does not exist
if (yadd > 0)
|| (!instance_exists(obj_mario)) {

    alarm[10] = 1;
    exit;
}

//Set the running sprite
sprite_index = spr_charginchuck_walk;

//Disable friction
friction = 0;
    
//Play sound
alarm[0] = 6;
    
//If Mario is above
if (obj_mario.bbox_bottom < y-16) {

    //Animate
    image_speed = 0.5;
    
    //Do not lookout
    lookout = 0;
    
    //Stop moving
    alarm[1] = 120;
    
    //Move towards Mario
    if (obj_mario.x < x)
        xspeed = (swimming) ? -0.5 : -1;
    else
        xspeed = (swimming) ? 0.5 : 1;
}

//Otherwise
else {
        
    //Animate
    image_speed = 1;
    
    //Lookout for Mario
    lookout = 1;
    
    //Move towards Mario
    if (obj_mario.x < x)
        xspeed = (swimming) ? -0.875 : -1.75;
    else
        xspeed = (swimming) ? 0.875 : 1.75;
}