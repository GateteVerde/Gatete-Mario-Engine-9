/// @description Launch the koopa outside from his shell

//Create shell
instance_create_depth(x, y, -2, obj_shell);

//Create green beach koopa
with (instance_create_depth(x, y, -2, obj_beachkoopa)) {

    //Set the sprite
    sprite_index = spr_beachkoopa;
    
    //Set the horizontal speed
    xspeed = 3*sign(obj_mario.xscale);
    
    //Do not allow movement
    ready = 0;
}

//Destroy
instance_destroy();