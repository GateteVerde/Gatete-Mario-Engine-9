/// @description Finish pull

//If the puller object exists
if (instance_exists(obj_mario_puller)) {

    //With Mario
    with (obj_mario) {
    
        visible = 1;
        holding = 0;
        enable_control = true;
    }
    
    //Destroy puller
    with (obj_mario_puller) instance_destroy();
    
    //Destroy
    instance_destroy();
}

//Otherwise, generate a coin
else {
	
	//Create 1up mushroom
	with (instance_create_depth(obj_mario.x, obj_mario.bbox_top-16, -4, obj_1up)) {
			
		xspeed = 1 * sign(obj_mario.xscale);
		yspeed = -4;
	}
	
	//Destroy
    instance_destroy();
}