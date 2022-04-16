/// @description Parent logic

//If the parent does exist.
if (instance_exists(parent)) {

    //If the parent is on the water.
    if (parent.jumping == 2) {
    
        //If the parent has not gobbled Mario
        if (!ready) {
        
            //Change the sprite of the parent.
            with (parent) {
            
                sprite_index = spr_bossbass;
            }
            
            //Gobble Mario
            ready = true;
            
            //Kill Mario
            instance_create_depth(x, y, -5, obj_mario_dead);
        }
    }
}
