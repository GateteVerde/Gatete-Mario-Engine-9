/// @description A Yoshi has born

//If there's not a yoshi in the room
if (instance_number(obj_yoshi) == 0) 
&& (instance_number(obj_yoshi_abandon) == 0) 
&& (instance_number(obj_yoshi_runaway) == 0) {

    //Hatch the egg
    with (instance_create_depth(x, y, -2, obj_egg_hatch)) {
    
        //Green Yoshi
        if (other.sprite_index == spr_egg)
            colour = 0;
            
        //Red Yoshi
        else if (other.sprite_index == spr_egg_r)
            colour = 1;
            
        //Yellow Yoshi
        else if (other.sprite_index == spr_egg_y)
            colour = 2;
                        
        //Blue Yoshi
        else if (other.sprite_index == spr_egg_b)
            colour = 3;
            
        //Teal Yoshi
        else if (other.sprite_index == spr_egg_t)
            colour = 4;
            
        //Pink Yoshi
        else if (other.sprite_index == spr_egg_p)
            colour = 5;
    }
}

//Otherwise
else {

    //Create a 1-UP and destroy the egg
    with (instance_create_depth(x, y, -2, obj_1up))
		move_after_landing = 1;
}

//Destroy the object
instance_destroy();