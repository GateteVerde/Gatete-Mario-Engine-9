/// @description Curtain-in effect

//Set the destination room
target = noone;

//Set the depth
depth = -19;

//The image is going to zoom in, so its initial size should be VERY big and shrink until it gets very small
scale = global.gw;

//Set the surface
surf = surface_create(room_width, room_height);

//Set the surface colour
surf_colour = c_black;