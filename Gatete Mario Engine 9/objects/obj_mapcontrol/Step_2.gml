/// @description Move towards the player

//Round position variables
x = round(x);
y = round(y);

//If the player exists
if (instance_exists(obj_mapmario)) {

    x = obj_mapmario.x + 8;
    y = obj_mapmario.y + 8;
}

//Clamp Y
var shake_val = 0;

//If there is a camera shake to occur
if (shake_time > 0) {
	
	//If the shake falls off from it's original value, calculate the shake value relative to the time left in the timer
	if (shake_falloff)
		shake_val = shake_intensity * (shake_time / shake_starttime);		
	
	//Otherwise
	else {
	
		//Match shake value to shake intensity
		shake_val = shake_intensity;
	}
	
	//Choose randomly between up and down shake
	shake_val = choose(-shake_val, shake_val);
	
	//Subtract shake time
	shake_time--;	
} 
else {

	// Make sure the shake time & start time bottom out to 0
	shake_time = 0;
	shake_starttime = 0;	
}

//Clamp the X/Y position to the room so that shakes on the bottom of the screen still occur fine
var camera_x = screen_round(clamp(x, camera_get_view_width(view_camera[0])/2, room_width - camera_get_view_width(view_camera[0])/2) - (camera_get_view_width(view_camera[0])/2));

//Initial clamp in view
var camera_y = screen_round(clamp(y, camera_get_view_height(view_camera[0])/2, room_height - camera_get_view_height(view_camera[0])/2) - (camera_get_view_height(view_camera[0])/2));

//Clamp the screen shake
if (shake_val != 0) {
	
	camera_y = screen_round(clamp(camera_y+shake_val, 0, room_height-camera_get_view_height(view_camera[0])));
}

//Ensure there is no view target so that the camera can be manually moved
camera_set_view_target(view_camera[0], noone);

//Set the camera position
camera_set_view_pos(view_camera[0], camera_x, camera_y);