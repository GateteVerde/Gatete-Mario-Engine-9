/// @description Draw clouds or smog if required

//Clouds
if (smog == 1)
    draw_sprite_tiled_ext(spr_fgr_clouds, 0, screen_round(camera_get_view_x(view_camera[0]) / 2 + pos*2), camera_get_view_y(view_camera[0]), 1, 1, smog_colour, alpha/8);

//Smog
else if (smog == 2) {

    //Set blending mode
    gpu_set_blendmode(bm_add);
    
    //Draw the background
    if (sprite_get_height(spr_fgr_smog) < room_height)
    && (sprite_get_height(spr_fgr_smog) > camera_get_view_height(view_camera[0]))
        draw_sprite_tiled_area_ext(spr_fgr_smog, 0, screen_round(camera_get_view_x(view_camera[0]) / 2 + pos*2), camera_get_view_y(view_camera[0]) * (room_height-sprite_get_height(spr_fgr_smog) / (room_height - camera_get_view_height(view_camera[0]))), 0, 0, room_width, room_height, smog_colour, alpha);
    else
        draw_sprite_tiled_area_ext(spr_fgr_smog, 0, screen_round(camera_get_view_x(view_camera[0]) / 2 + pos*2), y, 0, 0, room_width, room_height, smog_colour, alpha);
        
    //Set blending mode to normal
    gpu_set_blendmode(bm_normal);
}