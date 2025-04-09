/// @description SHS Lighting surface and drawing methods.

//Set ambient light
ambient_light = c_black + (c_white / 255) * intensity;

//Prepare the surface
if (!surface_exists(surf_light)) {

	surf_light = surface_create(global.gw, global.gh);
}

//Set the surface target
surface_set_target(surf_light);

//Clear the white colour from the lights
draw_clear(c_white - ambient_light);

//Set the blending mode
gpu_set_blendmode(bm_subtract);

//Enable texture interpolation
gpu_set_texfilter(true);

//With all lights
with (obj_lightparent) {
			
	//If the light makes use of a sprite, draw the sprite
	if (sprite_index != -1)
		draw_sprite_ext(sprite_index, image_index, x-camera_get_view_x(view_camera[0]), y-camera_get_view_y(view_camera[0]), image_xscale, image_yscale, image_angle, image_blend, 1);
				
	//Otherwise, use the User Defined 15 event from said object
	else
		event_user(15);
}

//Disable texture interpolation
gpu_set_texfilter(false);

//Set the blending mode to normal
gpu_set_blendmode(bm_normal);

//Reset the surface target
surface_reset_target();