/// @description Whistle again

//If the chuck is damaged
if (sprite_index == spr_charginchuck_damage)
exit;

//Play 'Chuck Whistle' sound
audio_play_sound(snd_chuck_whistle, 0, false);

//Wake up all nearby enemies
global.whistle = 1;

//Repeat
alarm[0] = 90;

//Spawn in a super koopa
if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) {

    //Choose a side to spawn from
    var spawn_x = choose(camera_get_view_x(view_camera[0]) - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16);
    
    //Choose a random Y position to spawn in at
    var spawn_y = irandom_range(camera_get_view_y(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) -96);
    
    //Create the koopa
    instance_create_depth(spawn_x, spawn_y, -2, obj_beachkoopa_super);
}