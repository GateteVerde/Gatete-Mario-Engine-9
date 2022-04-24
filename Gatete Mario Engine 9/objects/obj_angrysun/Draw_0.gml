/// @description Render me

if (ready == 0)
    draw_sprite_ext(sprite_index, -1, screen_round(camera_get_view_x(view_camera[0]))+64, screen_round(camera_get_view_y(view_camera[0]))+48, 1, 1, 0, c_white, 1);
else
    draw_sprite_ext(sprite_index, -1, screen_round(camera_get_view_x(view_camera[0]))+obj_angrysun_movement.x, screen_round(camera_get_view_y(view_camera[0]))+obj_angrysun_movement.y, 1, 1, 0, c_white, 1);
