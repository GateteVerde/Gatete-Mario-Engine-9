/// @description Curtain-in effect

//Depth
depth = -9;

//The image is going to zoom out, so its initial size should be VERY big and shrink until it gets very small.
scale = 0;

//Set the surface
surf = surface_create(room_width, room_height);

//Set the surface colour
surf_colour = c_black;