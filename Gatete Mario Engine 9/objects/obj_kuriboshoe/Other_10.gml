/// @description Get off the shoe

with (instance_create_depth(x, y, -2, obj_getshoe)) {

    //Use correct shoe sprite
    switch (global.mountcolour) {
    
        //Baburu Shoe
        case (1): sprite_index = spr_shoe_baburu; break;
        
        //Dossun Shoe
        case (2): sprite_index = spr_shoe_dossun; break;
        
        //Jugemu Shoe
        case (3): sprite_index = spr_shoe_jugemu; break;
        
        //Pentaro Shoe
        case (4): sprite_index = spr_shoe_pentaro; break;
    }
    
    //Disallow pick up
    canpick = 0;
    
    //Allow it after a while
    alarm[0] = 60;
    
    //Move the player up
    obj_mario.y -= 16;
    
    //Set the facing direction
    if (instance_exists(obj_mario)) {
    
        //Hereby horizontal speed
        xspeed = obj_mario.xspeed/2;
    
        //Hereby facing direction
        dir = obj_mario.xscale;
    }
}

//Destroy
instance_destroy();
