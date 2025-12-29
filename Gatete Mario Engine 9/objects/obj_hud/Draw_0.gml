/// @description Draw the HUD

//Set default font and colour
draw_set_font(global.gui_font_numbers);
draw_set_colour(c_white);

//Lives and Coin position
var main_x = camera_get_view_x(view_camera[0]) + 8;

//Health
if (global.hp_mode == 1) {
	
	//Set the position of the HUD element
	main_x += 41;
	
	//Frame
	var frame = (global.powerup == cs_tiny) ? 5 : global.hp
	
	//Scale
	#region
	
		//If Mario has 1 HP left or has the tiny mushroom, animate the health
		if ((global.hp == 1) || (global.powerup == cs_tiny)) {
			
			//Increment Time
			scale_t++;
			
			//Set scale
			scale = 1 + 0.2 * abs(sin(scale_t/24))
		}
		else {
			
			scale -= 0.1;
			if (scale < 1)
				scale = 1;
		}

	#endregion
	
	//Health
	draw_sprite_custom_origin(spr_gui_global_health, frame, camera_get_view_x(view_camera[0]) + 11, camera_get_view_y(view_camera[0]) + 11, 16, 16, scale, scale, 0, c_white, 1);
}

//Lives
draw_sprite_ext(spr_gui_mario, global.player, main_x, camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
draw_text(main_x + 33, camera_get_view_y(view_camera[0]) + 8, string_add_zeroes(lives, 2));

//Coins
draw_sprite_ext(spr_gui_coins, 0, main_x + 8, camera_get_view_y(view_camera[0]) + 19, 1, 1, 0, c_white, 1);
draw_text(main_x + 33, camera_get_view_y(view_camera[0]) + 19, string_add_zeroes(global.coins, 2));

//Safeguard
#region SAFEGUARD

	//Do not display if hp mode is on
	if (global.hp_mode == 0) {
		
		var a;
		a = 0;
		repeat (global.safeguard) {
	
			draw_sprite_ext(spr_gui_heart, 0, camera_get_view_x(view_camera[0]) + (64 + a), camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
			a += 8;
		}
	}
#endregion

//Star Coin position
var star_y = camera_get_view_y(view_camera[0]) + 30;
if (ds_map_size(global.powerstars) > 0) {
	
	//Set the position for the star coin display
	star_y += 11;
	
	//Draw the current stars
	draw_sprite_ext(spr_gui_stars, 0, main_x, camera_get_view_y(view_camera[0]) + 30, 1, 1, 0, c_white, 1);
	draw_text(main_x + 25, camera_get_view_y(view_camera[0]) + 30, string_add_zeroes(ds_map_size(global.powerstars), 3));
}

//Star Coins
#region STAR COINS

	if (global.level != noone) {
    
	    //Draw the coin spot
	    draw_sprite_ext(spr_gui_global_sc, 0, main_x, star_y, 1, 1, 0, c_white, 1);
    
	    //Draw the coins
	    for (var i = 0; i < 3; i++) {
                
	        if (ds_map_find_value(global.sc[i], global.level) > 0)
	            draw_sprite_ext(spr_gui_global_sc_coin, 0, main_x + (16*i), star_y, 1, 1, 0, c_white, 1);
	    }
	}
#endregion

//Reserve Box
#region RESERVE BOX / HEALTH
	
	//Do not show reserve box if Mario is on a vehicle
	if ((instance_exists(obj_levelcontrol)) && (obj_levelcontrol.shmup_mode == 0)) {
	
		//Draw Reserve Box
		draw_sprite_ext(spr_gui_global_reserve, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 16, 1, 1, 0, c_white, 1);
		
		//If the reserve item system is activated
		if (global.reserve_activated == true) && (global.reserve != cs_small) {
			
			draw_sprite_ext(macro_get_sprite(global.reserve), -1, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 16, 1, 1, 0, c_white, 1);
		}
	}
#endregion

//Set black font
draw_set_font(global.gui_font_numbers);

//Score positions
var score_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 128;
var score_y = camera_get_view_y(view_camera[0]) + 8;

//Check if the camera's width isn't wide enough
if (global.reserve_activated == true)
&& (camera_get_view_width(view_camera[0]) < 320) {
	
	//If not, move the score HUD to underneath the counter
	score_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 72;
	score_y += 11;	
}

//Score
draw_text(score_x, score_y, string_add_zeroes(score, 8));
if (clear == 1) {
	
	//Draw 'Course Clear' prompt
	draw_sprite_ext(spr_gui_global_clear, global.player, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 64, camera_get_view_y(view_camera[0]) + 80, 1, 1, 0, c_white, 1);

	//Draw time
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 56, camera_get_view_y(view_camera[0]) + 104, string_format(time, 4, 0));
	
	//Draw time multiplier
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 16, camera_get_view_y(view_camera[0]) + 104, string_format(multiplier, 3, 0));
	
	//Draw time * multiplier
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 + 16, camera_get_view_y(view_camera[0]) + 104, string_format(global.timer * multiplier, 6, 0));
}

//Set gold font
draw_set_font(global.gui_font_numbers_gold);

#region TIME DISPLAY

	//Set the time to display when the level is clear
	if (global.clear > 0) {

		if (dtime2 == 0) {
		
			dtime2 = global.timer;
			dtime = dtime2;
		}
	}
	else
		dtime = global.timer;
	
#endregion
	 
//Time
draw_sprite_ext(spr_gui_time, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 48, camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 40, camera_get_view_y(view_camera[0]) + 8, string_format(dtime, 4, 0));
	
//Set large font
draw_set_font(global.gui_font_numbers_large)

//Coin Collect-a-thon
if (global.collect_mode > 0) {
	
	draw_sprite_ext(spr_gui_bonus, 0, camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24, 1, 1, 0, c_white, 1);
	if (global.coins_left > 0)
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24, string_add_zeroes(global.coins_left, 3));
	else
		draw_sprite_ext(spr_gui_bonus, 1, camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24, 1, 1, 0, c_white, 1);
}

//P-Meter
#region P-METER
	
	//If the player does exist
	if (instance_exists(obj_mario)) {
	
		//If the P-Wing is active or the P-Meter is above 111
		if (global.pwing == 1)
		|| (obj_mario.pmeter > 143)
			draw_sprite_ext(spr_gui_pmeter, 6+flash, camera_get_view_x(view_camera[0]) + (8 + pmeterx), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, 1, 1, 0, c_white, 1);
		else
			draw_sprite_ext(spr_gui_pmeter, 0+(obj_mario.pmeter/24), camera_get_view_x(view_camera[0]) + (8 + pmeterx), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, 1, 1, 0, c_white, 1);
	}
	else {
	
		draw_sprite_ext(spr_gui_pmeter, 0+(fake_pm/24), camera_get_view_x(view_camera[0]) + (8 + pmeterx), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, 1, 1, 0, c_white, 1);
	}
	
#endregion

//SMB3 Card System
#region SMB3 CARDS

	if (show_cards > 0) {
	
		draw_sprite_ext(spr_gui_cardbox, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 53, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 21, 1, 1, 0, c_white, min(show_cards/30, 1));
		for (i=0; i<3; i++) {
		
			if (global.card[i] != -1)
				draw_sprite_ext(spr_gui_cardbox_cards, global.card[i], camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 52 + (16 * i), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 20, 1, 1, 0, c_white, min(show_cards/30, 1));
		}
	}
	
#endregion

//Advance Coins
#region ADVANCE COINS

if (ds_map_size(global.acecoins) > 0) {

	//Draw the outlines
	draw_sprite_ext(spr_gui_acecoins, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 48, camera_get_view_y(view_camera[0]) + 19, 1, 1, 0, c_white, 1);
	
	//Draw the collected coins
	var j = 0;
	repeat (ds_map_size(global.acecoins)) {
	
		draw_sprite_ext(spr_gui_acecoins, 1, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - (48 - j), camera_get_view_y(view_camera[0]) + 19, 1, 1, 0, c_white, 1);
		j += 8;
	}	
}
#endregion