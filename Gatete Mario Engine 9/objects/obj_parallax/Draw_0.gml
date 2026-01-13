/// @description Render backgrounds

//Constants
var lay_id			= layer_get_id("Background");
var back_id			= layer_background_get_id(lay_id);
var back_spr		= layer_background_get_sprite(back_id);
var back_spr_frames = asset_get_index(sprite_get_name(back_spr) + "_frames");

//If a sprite exists with animated frames
if (sprite_exists(back_spr_frames)) {
	
	//Temporary variables for animated background layer
	var rate_main, xx_main, yy_main;
	
	rate_main = 1.2;
	xx_main = obj_levelcontrol.camera_x;
	yy_main = obj_levelcontrol.camera_y;
	
	#region Background Position
	
		var x_pos_main = (xx_main / rate_main);
		var y_pos_main = 0;
	
		if (room_height > sprite_get_height(back_spr))
			y_pos_main = layer_get_y(layer_get_id("Background")) + (yy_main / rate_main / 2);
		else
			y_pos_main = room_height - sprite_get_height(back_spr);
	#endregion
	
	//Draw the first background
	draw_sprite_tiled_ext(back_spr, floor(frame), x_pos_main, y_pos_main, 1, 1, c_white, 1);
	
	//Cycle and draw all frames
	for (var i = 0; i < sprite_get_number(back_spr_frames); i++) {
	
		var rate, xx, yy;

		//Set rate and position
		rate[i] = 1.4 + (0.2 * i);
		xx[i] = obj_levelcontrol.camera_x;
		yy[i] = obj_levelcontrol.camera_y;
	
		#region Background Position
	
			var x_pos = (xx[i] / rate[i]) + (time * scroll[i]);
			var y_pos = 0;
	
			if (room_height > sprite_get_height(back_spr_frames))
				y_pos = layer_get_y(layer_get_id("Background")) + (yy[i] / rate[i] / 2);
			else
				y_pos = room_height - sprite_get_height(back_spr_frames);
		#endregion
	
		//Draw the background
		draw_sprite_tiled_ext(back_spr_frames, i, x_pos, y_pos, 1, 1, c_white, 1);
	}
}

//Otherwise
else {

	//Cycle and draw all frames
	for (var i = 0; i < sprite_get_number(back_spr); i++) {
	
		var rate, xx, yy;

		//Set rate and position
		rate[i] = 1.2 + (0.2 * i);
		xx[i] = obj_levelcontrol.camera_x;
		yy[i] = obj_levelcontrol.camera_y;
	
		#region Background Position
	
			var x_pos = (xx[i] / rate[i]) + (time * scroll[i]);
			var y_pos = 0;
	
			if (room_height > sprite_get_height(back_spr))
				y_pos = layer_get_y(layer_get_id("Background")) + (yy[i] / rate[i] / 2);
			else
				y_pos = room_height - sprite_get_height(back_spr);
		#endregion
	
		//Draw the background
		draw_sprite_tiled_ext(back_spr, i, x_pos, y_pos, 1, 1, c_white, 1);
	}
}

//Update background layer scrolling (You may change the rate of the timer however it affects all layers, if you want *a* layer to get affected, set a bg index to a value.)
time++;

//Update frame
frame += 0.15;