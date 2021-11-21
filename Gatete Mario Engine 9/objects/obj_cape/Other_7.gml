/// @description End cape animations

//If the cape is moving up
if (sprite_index == spr_cape_up) {

    //If the state is cape_walk
    if (state == capestate.cape_walk) {
    
        //Set the sprite
        sprite_index = spr_cape_walk;
        
        //Animate
        image_speed = 0.2;
    }
    
    //Otherwise, if the state is cape_jump_down
    else if (state == capestate.cape_jump_down) {
    
        //Set the sprite
        sprite_index = spr_cape_fall;
        
        //Animate
        image_speed = 0.2;    
    }
}

//Otherwise, if the cape is moving down
else if (sprite_index == spr_cape_down) {

    //Set the sprite
    sprite_index = spr_cape;
    
    //Do not animate
    image_speed = 0;
    image_index = 0;
}