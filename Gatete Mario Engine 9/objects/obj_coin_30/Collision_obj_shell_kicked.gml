/// @description Collect the coin

//If not animating faster
if (ready != 2) {
	
	//Get 30 coins
	coins_add(30);
	
	//Remember last y position
	yy = y;
	
	//Perform coin collection and get points
	event_user(0);
	with (instance_create_depth(x, y, -6, obj_score))
		value = 100;
}