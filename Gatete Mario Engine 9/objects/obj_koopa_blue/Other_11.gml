/// @description Launch the koopa outside from his shell

//Create shell
with (instance_create_depth(x, y, -2, obj_shell)) sprite_index = spr_shell_blue;

//Create blue beach koopa
with (instance_create_depth(x, y, -2, obj_beachkoopa_blue)) {

    //Set the sprite
    sprite_index = spr_beachkoopa_blue;
    
    //Set the horizontal speed
	if (instance_exists(obj_mario))
		xspeed = 3*sign(obj_mario.xscale);
	else
		xspeed = 3;
    
    //Do not allow movement
    ready = 0;
}

//Destroy
instance_destroy();