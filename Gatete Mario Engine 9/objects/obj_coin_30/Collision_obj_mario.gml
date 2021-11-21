/// @description Collect the coin

//If not animating faster
if (image_speed != 0.8) {
	
	//Get 30 coins
	coins_add(30);
	
	//Perform coin collection and get points
	event_user(0);
	with (instance_create_depth(x, y, -6, obj_score))
		value = 100;
}