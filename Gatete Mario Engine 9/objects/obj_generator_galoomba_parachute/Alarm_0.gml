/// @description Generate a Parachute Galoomba

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
		
		//Generate a Parachute Galoomba
		instance_create_depth(camera_get_view_x(view_camera[0]) + random_range(32, global.gw - 32), camera_get_view_y(view_camera[0]) - 32, -2, obj_galoomba_parachute);
		
		//Generate a new one after 3 seconds
		alarm[0] = 180;
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
