/// @description Lock camera depending of the variables set

//If Mario does exist
if (instance_exists(obj_mapmario))
&& (point_in_rectangle(obj_mapmario.x, obj_mapmario.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {

	//Lock the camera
	with (obj_mapcontrol) {

		//If this object locks the camera in the x-axis
		if (other.camera_lock_x == true) {
		
			camera_x = other.camera_x;
			camera_lock_x = true;
		}
		
		//If this object locks the camera in the y-axis
		if (other.camera_lock_y == true) {
		
			camera_y = other.camera_y;
			camera_lock_y = true;
		}
		
		//Allow generation of clouds
		clouds = other.clouds;
	}
}