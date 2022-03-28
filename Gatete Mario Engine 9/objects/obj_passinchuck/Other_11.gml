/// @description Custom stomp 

//If there's 2 hits or less
if (firehp < 2) {
	
	//Get 2000 points
	with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score)) value = 2000;
			
	//Stomp the enemy
    event_inherited();
}
	
//Otherwise
else {

	//Create a new chuck
	with (instance_create_depth(x, y, depth, obj_charginchuck)) {

		event_user(1);
		hp = 1;
		firehp = other.firehp-2;
	}

	//Destroy
	instance_destroy();
}