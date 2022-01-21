/// @description World Map manager

//The music of the level
mapmusic = noone;

//Play music
alarm[0] = 32;

//Generate a cloud every second
alarm[11] = 60;

//Fade out
instance_create_depth(0, 0, -99, obj_curtain_out);

//Create HUD
//instance_create_layer(0, 0, "GUI", obj_hud);

//Shake variables
shake_intensity = 0;
shake_time = 0;
shake_falloff = 0;

//Used for calculating falloff
shake_starttime = 0;