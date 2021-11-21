/// @function outside_view();

function outside_view() {

	//If the object is outside the view, return true
	if (x < camera_get_view_x(view_camera[0]) - sprite_width)
	|| (y < camera_get_view_y(view_camera[0]) - 32)
	|| (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + sprite_width)
	|| (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32)
		return true;
	else
		return false;		
}