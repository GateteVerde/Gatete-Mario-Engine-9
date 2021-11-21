/// @description Respawn

if (xstart < camera_get_view_x(view_camera[0]) - sprite_width)
|| (xstart > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) {

    //Return to semisolid position
    y = sm.y;
    
    //Allow the player to make the platform fall
    ready = 0;
	
	//Make it visible
	if (visible == 1)
		visible = 0;
}
else
    alarm[0] = 1;