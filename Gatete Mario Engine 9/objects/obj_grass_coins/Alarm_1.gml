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
	
	//Create coin
	repeat (5) {
		
		with (instance_create_depth(obj_mario.x, obj_mario.bbox_top-16, -4, obj_coinnpc)) {
			
			xspeed = random_range(1, -1);
			yspeed = random_range(-1, -5);
		}
	}
	
	//Destroy
    instance_destroy();
}