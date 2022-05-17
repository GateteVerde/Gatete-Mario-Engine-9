/// @description Force end cloud state on player

with (obj_mario) {

    //End cloud state
    oncloud = false;
    
    //Allow the player to jump
    if (jumping != 0)
        jumping = 2;
}

with (mytop) instance_destroy();
