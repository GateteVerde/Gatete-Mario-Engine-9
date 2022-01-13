/// @description Make yoshi lay a egg

//Make sure the player state is not the jumping one
if (instance_exists(obj_mario))
&& (obj_mario.state < playerstate.jump) {

    with (instance_create_depth(x-8, y, -2, obj_egg_pow)) {
    
        //Check of what colour is yoshi and set up the sprite of the egg
        switch (obj_yoshi.colour) {
        
            //Green Yoshi
            case (0): sprite_index = spr_egg; break;
            
            //Red Yoshi
            case (1): sprite_index = spr_egg_r; break;
            
            //Yellow Yoshi
            case (2): sprite_index = spr_egg_y; break;
            
            //Blue Yoshi
            case (3): sprite_index = spr_egg_b; break;
            
            //Teal Yoshi
            case (4): sprite_index = spr_egg_t; break;
            
            //Pink Yoshi
            case (5): sprite_index = spr_egg_p; break;
        }
        
        //Set the horizontal speed
        hspeed = -1*sign(other.image_xscale);
    }
}

//Otherwise, wait...
else
    alarm[5] = 1;