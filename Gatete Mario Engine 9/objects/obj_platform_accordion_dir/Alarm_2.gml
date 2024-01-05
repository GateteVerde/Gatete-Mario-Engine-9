/// @description Contract

//Stop
alarm[3] = 32;

//Expand blocks in the direction
with (block1) { speed = -0.5; direction = other.direction; }
with (block2) { speed = -1; direction = other.direction; }
with (block3) { speed = -1.5; direction = other.direction; }
with (block4) { speed = -2; direction = other.direction; }