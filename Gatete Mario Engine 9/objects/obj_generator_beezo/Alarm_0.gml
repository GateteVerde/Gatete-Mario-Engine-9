/// @description Generate a Beezo

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
		
		//Generate a Beezo
		if (choose(0, 1) == 0)
			instance_create_depth(camera_get_view_x(view_camera[0]) + irandom_range(-16, 80), camera_get_view_y(view_camera[0]) - 24, -2, obj_beezo_red);
		else
			instance_create_depth(camera_get_view_x(view_camera[0]) + global.gw + irandom_range(-80, 16), camera_get_view_y(view_camera[0]) - 24, -2, obj_beezo_red);
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
