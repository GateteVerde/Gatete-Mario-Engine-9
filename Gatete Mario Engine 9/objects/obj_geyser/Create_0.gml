/// @description Water Geyser

//Inherit the parent event
event_inherited();

//Set depth
depth = layer_get_depth("Tileset_Decor");

//Stay at the bottom boundary
y = room_height;

//Rise up
ready = 0;
alarm[0] = 60;

//Manage offset
offset = 0;
offsetnext = 0;
alarm[2] = 7;