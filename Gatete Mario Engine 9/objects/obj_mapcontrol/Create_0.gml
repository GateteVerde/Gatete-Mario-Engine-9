/// @description World Map manager

//The music of the level
mapmusic = noone;

//Play music
alarm[0] = 32;

//Generate a cloud every second
alarm[11] = 60;

//Fade out
instance_create_depth(0, 0, -99, obj_fade_out);

//Create HUD
instance_create_layer(0, 0, "GUI", obj_hud_map);

//Is the camera locked
camera_x = 0;
camera_y = 0;
camera_lock_x = 0;
camera_lock_y = 0;

//Shake variables
shake_intensity = 0;
shake_time = 0;
shake_falloff = 0;

//Used for calculating falloff
shake_starttime = 0;