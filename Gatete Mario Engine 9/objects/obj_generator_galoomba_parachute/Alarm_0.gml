/// @description Generate a Parachute Galoomba

//If Mario does exist
if (instance_exists(obj_mario)) {

	//If Mario is inside the region
	if (point_in_rectangle(obj_mario.x, obj_mario.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
	
		//If the Silver P-Switch is active
		if (obj_levelcontrol.gswitch_on == true) {
		
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
		alarm[0] = 180;
		exit;
	}
}