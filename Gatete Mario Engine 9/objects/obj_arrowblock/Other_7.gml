/// @description Allow the block to be bumped

//Do not animate
image_speed = 0;
image_index = 0;

//Move 16 pixels upwards
y = y-16;

//Allow bump
ready = 0;

//Set the position of the solid block
mysolid.y = y;