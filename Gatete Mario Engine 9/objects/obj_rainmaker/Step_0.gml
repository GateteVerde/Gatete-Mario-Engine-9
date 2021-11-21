/// @description Generate rain drops

//If raining is activated
if (raining == true) {

    repeat (force) {
        
		instance_create_depth(random_range(camera_get_view_x(view_camera[0]) - 600, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 600), camera_get_view_y(view_camera[0]) - 5, random_range(-6, 9), obj_rain);
    }
}

//Update smog position
pos -= 0.25;