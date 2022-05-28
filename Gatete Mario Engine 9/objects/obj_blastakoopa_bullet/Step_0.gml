/// @description Blasta Koopa bullet logic

//Last direction
lastdir = direction;

//If not frozen
if (freeze == false) {
	
	//If the bullet is homing
	if (homing == true) {

		//Declare a new variable that hold the direction between your own position and the position of obj_mario
		if (instance_exists(obj_mario)) {
			
			//Followe either Mario or the camera
			new_dir = (instance_exists(obj_mario_transform)) ? point_direction(x, y, obj_levelcontrol.x, obj_levelcontrol.y) : point_direction(x, y, obj_mario.x, obj_mario.y);
			
			//Declare diff, diff is the difference in angle between where this object is going.
			diff = angle_difference(direction, new_dir);
		}
		else {
		
			//Follow the camera
			new_dir = point_direction(x, y, obj_levelcontrol.x, obj_levelcontrol.y);
			
			//Declare diff, diff is the difference in angle between where this object is going.
			diff = angle_difference(direction, new_dir);
		}
	}
	
	//Turn it
	direction -= min(2 * sign(diff), abs(diff));
}

#region SCALE

	if (hspeed > 0)
		yy = 1;
	else if (hspeed < 0)
		yy = -1;
#endregion

//Destroy if outside the view
if (x < camera_get_view_x(view_camera[0]) - 16)
|| (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16)
|| (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16)
    instance_destroy();
