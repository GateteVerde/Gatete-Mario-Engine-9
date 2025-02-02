/// @description Draw the HUD

//Set font
draw_set_font(global.gui_font_menu);

#region Inventory

	//Draw background
	draw_sprite_ext(spr_gui_map_inventory, -1, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - inv_offset_y, game_width/sprite_get_width(spr_gui_map_inventory), 1, 0, c_white, 1);

	//If there's powerups on the inventory
	if (obj_mapmario.boxselection > 0) {
		
		//Set sprite to use
		var sprite = (obj_coordinator.colourblind) ? spr_gui_map_inventory_items_cb : spr_gui_map_inventory_items;

		var inv_len = floor((game_width-22)/22);
		obj_mapmario.length = inv_len;
		
		var list_pos = obj_mapmario.list_pos;
		
		//Draw powerups
		for (var i = (list_pos+1); i <= inv_len+list_pos; i++)
		{
			
			if(i <= global.inventory[0])
			{
				//Set alpha of item
				alpha[i] = (obj_mapmario.boxselection == i) ? lerp(alpha[i], 1, 0.2) : lerp(alpha[i], 0.5, 0.2);
				scale[i] = (obj_mapmario.boxselection == i) ? lerp(scale[i], 1.5, 0.2) : lerp(scale[i], 1, 0.2);
			
		
				//Draw items in inventory
				draw_sprite_custom_origin(sprite, global.inventory[i], camera_get_view_x(view_camera[0]) + 30 + ((i-list_pos)-1) * 22, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - inv_offset_y + 10, 8, 8, scale[i], scale[i], 0, c_white, alpha[i]);
			}
		}
	}

#endregion

//Border
draw_sprite_stretched_ext(spr_gui_map_border, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), global.gw, global.gh, c_white, 1);

//If Mario's lives are shown
if (prompt == 0) {
	
	//Set font
	draw_set_font(global.gui_font_numbers);

	#region Render Mario and Lives

		//Set palette
		pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star);

		//Draw Cape
		if (global.powerup == cs_cape) {

			draw_sprite_ext(spr_cape_walk, anim, camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 16, -1, 1, 0, c_white, 1);
		}
	
		//Draw Mario
		draw_sprite_ext(global.walk_sprite[global.powerup], anim, camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 16, -1, 1, 0, c_white, 1);
	
		//Reset palette
		pal_swap_reset();

		//Lives
		draw_text_colour(camera_get_view_x(view_camera[0]) + 40, camera_get_view_y(view_camera[0]) + 24, "* " + string_format(lives, 2, 0), c_white, c_white, c_white, c_white, 1);

	#endregion
}

//Otherwise
else if (prompt == 1) {
	
	//Set golden font
	draw_set_font(global.gui_font_numbers_large_gold);
	
	//Draw Star Coin
	draw_sprite_ext(spr_gui_global_sc_coin, 0, camera_get_view_x(view_camera[0]) + 24, camera_get_view_y(view_camera[0]) + 16, 1, 1, 0, c_white, 1);
	
	//Draw current amount of Star Coins
	draw_text_colour(camera_get_view_x(view_camera[0]) + 48, camera_get_view_y(view_camera[0]) + 15, string_add_zeroes(global.starcoins, 3), c_white, c_white, c_white, c_white, 1);
}

//Otherwise, show amount of stars
else if (prompt > 1) {

	//Set golden font
	draw_set_font(global.gui_font_numbers_large_gold);
	
	//Draw Star Coin
	draw_sprite_ext(spr_starman, 0, camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 16, 1, 1, 0, c_white, 1);
	
	//Draw current amount of Power Stars
	draw_text_colour(camera_get_view_x(view_camera[0]) + 48, camera_get_view_y(view_camera[0]) + 15, string_add_zeroes(ds_map_size(global.powerstars), 3), c_white, c_white, c_white, c_white, 1);		
}

//Set font
draw_set_font(global.gui_font);

#region Render Level Name + Star Coins

	//If the level does have a ID
	if (levelid != noone) {
    
	    //Draw the coin spot
	    draw_sprite_ext(spr_gui_global_sc, 0, camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
    
	    //Draw the coins
	    for (var i = 0; i < 3; i++) {
                
			//If the coins were collected
	        if (ds_map_find_value(global.sc[i], levelid) > 0) {
                
	            if (ds_map_find_value(global.sc[i], levelid) == 2)
	                draw_sprite_ext(spr_gui_global_sc_coin, anim, camera_get_view_x(view_camera[0]) + 80 + (16*i), camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
	            else
	                draw_sprite_ext(spr_gui_global_sc_coin, 0, camera_get_view_x(view_camera[0]) + 80 + (16*i), camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
	        }
	    }
	}
	
	#region LEVEL NAME
	
		//Temporary variables
		var str = levelname;
		var len = string_length(str);
		
		//Render level name
		if (len > 37) {
			
			draw_text_port("                                     " + string(levelname), camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 24, 295, 8, rate);
			rate--;
			if (rate < -((37 + len) * 8))
				rate = 0;
		}
		else {
			
			draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 24, string(levelname));
			rate = 0;
		}
		
	#endregion

#endregion

//Display "GAME SAVED!"
if (show_saved > 0)
&& (obj_coordinator.autosave == true) {
	
	draw_set_halign(fa_right);
	draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 2, camera_get_view_y(view_camera[0]) + 2, "GAME SAVED!", c_black, c_white, 1, 1, show_saved/2, show_saved);
	draw_set_halign(fa_left)
}