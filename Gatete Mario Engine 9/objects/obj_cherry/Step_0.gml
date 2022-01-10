/// @description Cherry logic

//If collected
if (ready == 1) {

	//If fully scaled down
	if (scale < 0.05) {
	
		instance_create_depth(x + 8, y + 8, -4, obj_smoke);
		instance_destroy();
		exit;
	}
	
	//Change angle
	angle += 4;
	
	//Decrement scale
	scale -= 0.0125;
}