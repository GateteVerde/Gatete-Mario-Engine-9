/// @description Draw the text and the message box

//Update dialogue prompts
dia_anim += 0.15;

//Draw the screenshot
freeze_render();

//Draw the message box
draw_sprite_ext(spr_gui_dialogue, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 56, 1, 1, 0, c_white, 1);

//If the text is being displayed
if (showing == 1) {
	
	#region MUGSHOT
	
		//If there's a mugshot
		if (mugshot != noone) {
	
			//Draw the mugshot
			draw_sprite_ext(mugshot, mug_anim, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 140, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 80, 1, 1, 0, c_white, 1);
        
	        //Animate the mugshot
	        if (a < string_length(text))       
	            mug_anim += 0.125;
	        else
	            mug_anim = 0;
		}
	#endregion
	
	#region TEXT / CHARACTER NAME

	    //Increment the number of letters that should be displayed
	    if (a <= string_length(text)) a++;
	
		//Set the font
		draw_set_font(global.gui_font);
	
		//Draw the text
		draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 96, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 72, string_copy(text, 1, a), c_black, c_white, 1, 1, 0.5, 1);
		
		if (char_name != noone) {
			
			//Draw the message stub (Character name length + sides buffer, multiplied by texel width)
			var _stub_width = ((8 * string_length(string(char_name))) + 16) * (1.0 / sprite_get_width(spr_gui_dialogue_stub));
			draw_sprite_ext(spr_gui_dialogue_stub, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - (sprite_get_width(spr_gui_dialogue) / 2), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 56 - (sprite_get_height(spr_gui_dialogue) / 2) + 7, _stub_width, 1, 0, c_white, 1);
			
			//Draw character name
			draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 136, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 83, string(char_name), c_black, c_white, 1, 1, 0.5, 1);
		}
	#endregion
	
	//Draw continue / finish arrow.
    if (a >= string_length(text)) {
    
        if (new_text = "")
            draw_sprite_ext(spr_gui_dialogue_end, dia_anim, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 + 128, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 48, 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(spr_gui_dialogue_next, dia_anim, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 + 128, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 48, 1, 1, 0, c_white, 1);
    }
}