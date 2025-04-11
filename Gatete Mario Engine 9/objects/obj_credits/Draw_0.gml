/// @description Draw the credits

//Set the font
draw_set_font(global.gui_font);

//Set the alpha
draw_set_alpha(alpha);

//Align the text to the center
draw_set_halign(fa_center);

//Draw the title
draw_sprite_ext(spr_title, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, (camera_get_view_y(view_camera[0]) + (global.gh / 2) - 32) - yy, (global.gw/sprite_get_width(spr_title)) - 0.1, (global.gw/sprite_get_width(spr_title)) - 0.1, 0, c_white, alpha);

//Text
draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0])-yy, string(text), c_black, c_white, 1, 1, 0.5, 1);

//Draw the curtain
draw_sprite_ext(spr_curtain, 1, x, y - curtain_yy, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_curtain, 0, x, y, 1, 1, 0, c_white, 1);

//Draw 'The end'
if ((ready >= 6) && (alpha2 > 0)) {

	//The End
    draw_sprite_ext(spr_theend, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + (global.gh / 2) - 16, 1, 1, 0, c_white, alpha2);
 
	//Display 'Press Any Key!' text
	if (display) {
		
		//Set font
		draw_set_font(global.gui_font_menu);
		
		//Draw 'PRESS ANY KEY!' text
        draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0])+176, "PRESS ANY KEY!", c_black, c_white, 1, 1, alpha/2, alpha);
	}
}