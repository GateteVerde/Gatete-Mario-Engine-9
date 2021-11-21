/// @description Respawn

if (xstart < camera_get_view_x(view_camera[0]) - sprite_width)
|| (xstart > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]))
|| (ystart < camera_get_view_y(view_camera[0]) - sprite_height)
|| (ystart > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) {

	//Restart animation
	image_speed = 0;
	image_index = 0;

    //Return to start position
    x = xstart;
    y = ystart;
    
    //Reset values
    speed = 0;
    gravity = 0;
    
    //Allow the player to make the platform fall
    state = 0;
}
else
    alarm[1] = 1;