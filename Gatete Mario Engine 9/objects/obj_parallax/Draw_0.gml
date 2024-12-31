/// @description Render backgrounds

//Constants
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
var back_spr = layer_background_get_sprite(back_id);

//Cycle and draw all frames
for (var i = 0; i < sprite_get_number(back_spr); i++) {
	
	var rate, xx, yy;

	//Set rate and position
	rate[i] = 1.2 + (0.2 * i);
	xx[i] = obj_levelcontrol.camera_x;
	yy[i] = obj_levelcontrol.camera_y;
	
	//Manage X position
	var x_pos = (xx[i] / rate[i]) + (time * scroll[i]);
	
	//Manage Y position
	var y_pos = (layer_get_y(layer_get_id("Background")) + (yy[i] / rate[i] / 2));
	
	//Render background
	#region
	
		//If the background is animated
		if (obj_levelcontrol.bg_is_animated) {
		
			//Update frame
			if (frame > obj_levelcontrol.bg_frames) then frame = 0;

			//Render the animated background
			draw_sprite_tiled_ext(back_spr, round(frame), x_pos, y_pos, 1, 1, c_white, 1);
			
			//Render the remaining background parts
			if (i > obj_levelcontrol.bg_frames)
				draw_sprite_tiled_ext(back_spr, (obj_levelcontrol.bg_frames + i+1), x_pos, y_pos, 1, 1, c_white, 1);
		}
		else
			draw_sprite_tiled_ext(back_spr, i, x_pos, y_pos, 1, 1, c_white, 1);
		
	#endregion
}

//Update scrolling 
//You may change the rate of the timer however it affects all layers
//if you want *a* layer to get affected, set a bg index to a value
time++;
