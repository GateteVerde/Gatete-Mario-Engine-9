/// @description Transition logic

//Handle the scale of the effect.
#region SIZE

	//Snap to the center of the view.
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

	//This grows the image, you can change the values to control how fast the circle should grow.
	scale = lerp(scale, (global.gw + 32), 0.03);
	if (scale > (global.gw + 32)) {
		
	    instance_destroy();
		exit;	// Stop executing the event if i've been destroyed
	}
#endregion

//Check if the surface still exists
if (!surface_exists(surf))
    surf = surface_create(room_width, room_height);

//Otherwise, draw the iris-out effect.
else {

    //Set the target surface.
    surface_set_target(surf);
    
    //Clear white parts
    draw_clear(c_white-surf_colour);
    
    //Set the blending mode
    gpu_set_blendmode(bm_subtract);
    
    //Draw the transition image.
	draw_set_circle_precision(64);
    draw_circle_colour(x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]), scale, c_white, c_white, 0);
    
    //Set the blending end mode
    gpu_set_blendmode(bm_normal);
    
    //Reset the surface target
    surface_reset_target();
}