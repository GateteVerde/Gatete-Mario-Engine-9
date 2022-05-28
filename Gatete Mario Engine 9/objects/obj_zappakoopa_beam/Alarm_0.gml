/// @description Create balls

//If the parent does exist
if (instance_exists(parent)) {

    //If facing right
    if (parent.xscale == 1) {
    
        with (instance_create_depth(x+lengthdir_x(random(24), random(360)), y+lengthdir_y(random(24), random(360)), depth - 1, obj_zappakoopa_beam_eff)) {
        
            target = other.id;
        }
    }
    
    //Otherwise, if facing left
    else if (parent.xscale == -1) {
    
        with (instance_create_depth(x+lengthdir_x(random(24), random(360)), y+lengthdir_y(random(24), random(360)), depth - 1, obj_zappakoopa_beam_eff)) {
        
            target = other.id;
        }
    }
}

//Repeat process
alarm[0] = 2;
