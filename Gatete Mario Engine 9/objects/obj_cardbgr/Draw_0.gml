/// @description Render background

if (room_height mod 16)
	draw_sprite_stretched_ext(sprite_index, obj_cardmanager.anim, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), global.gw, global.gh, c_white, 1);
else
	draw_sprite_stretched_ext(sprite_index, obj_cardmanager.anim, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), global.gw, global.gh + 8, c_white, 1);