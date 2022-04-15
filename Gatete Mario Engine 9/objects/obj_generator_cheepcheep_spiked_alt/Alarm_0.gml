/// @description Generate a swimming Spiked Cheep-Cheep

//If Mario does exist
if (instance_exists(obj_mario)) {

	//If Mario is inside the region
	if (obj_mario.x > xmin) 
	&& (obj_mario.x < xmax) {
	
		//If the Silver P-Switch is active and Mario is not transforming
		if (obj_levelcontrol.gswitch_on == true) 
		|| (instance_exists(obj_mario_transform)) {
		
			//Hold event
			alarm[0] = 1;
			exit;
		}
		
		//Repeat
		alarm[0] = 80;
		
		//Swap direction
		dir = -dir;
		
		//Generate a cheep-cheep
		if (dir == 1)
			instance_create_depth(camera_get_view_x(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) + random_range(32, global.gh-32), -2, obj_generatorcheep_spiked_alt);
		else
			instance_create_depth(camera_get_view_x(view_camera[0]) + global.gw + 16, camera_get_view_y(view_camera[0]) + random_range(32, global.gh-32), -2, obj_generatorcheep_spiked_alt);
	}
	
	//Otherwise
	else {
	
		//Hold event
		alarm[0] = 1;
		exit;
	}
}

//Otherwise
else {

	//Hold event
	alarm[0] = 1;
	exit;
}
