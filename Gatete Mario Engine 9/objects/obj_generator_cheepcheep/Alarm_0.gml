/// @description Generate a Jumping Cheep-Cheep

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
		alarm[0] = 40;
		
		//Generate a cheep-cheep
		instance_create_depth(camera_get_view_x(view_camera[0]) + random_range(48, global.gw - 48), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16, -2, obj_cheepcheep_jump2);
	}
	
	//Otherwise
	else {
	
		//Hold event
		alarm[0] = 1;
		exit;
	}
}