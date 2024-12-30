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
	#region
	
		//Call temporary variable
		var y_pos = 0;
	
		if (sprite_get_height(back_spr) > 432)
			y_pos = layer_get_y(layer_get_id("Background")) + (yy[i] / rate[i] / 2);
		else
			y_pos = room_height - sprite_get_height(back_spr) + rate[i];
	
	#endregion
	
	//Draw the background
	draw_sprite_tiled_ext(back_spr, i, x_pos, y_pos, 1, 1, c_white, 1);
}

//Update scrolling 
//You may change the rate of the timer however it affects all layers
//if you want *a* layer to get affected, set a bg index to a value
time++;