/// @description Mario Jump logic

//If the player jumps up to the target height
if (y < ystart) {
	
	//Create explosion
	with (instance_create_layer(x, y-8, "Main", obj_explosion_lite)) hurtplayer = 0;

    //Create Mario
    with (instance_create_depth(x, y, -5, obj_mario)) state = playerstate.jump;

    //Destroy
    instance_destroy();
}