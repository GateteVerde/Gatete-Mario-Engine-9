/// @description Make the koopa hide inside the shell

with (instance_create_depth(x, y, -2, obj_shell)) {

	//Set the sprite
	sprite_index = spr_shell_buzzy;
	
	//Make the koopa wake up
	koopainside = -1;
}

//Destroy
instance_destroy();