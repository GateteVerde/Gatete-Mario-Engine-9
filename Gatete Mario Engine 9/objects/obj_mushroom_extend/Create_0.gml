/// @description Expandable Mushroom

//Inherit event from parent
event_inherited();

//Do not animate
image_speed = 0;

//Depth
depth = 150;

//Boop to notify the mushroom is about to change
boop = 0;

//How much boops changes the shroom size
boop_change = 0;

//Palette
pal = 0;

//New xscale
xscale_new = 1;

//New yscale
yscale_new = 2;

//How long it takes until the platform starts shrinking
shrink_time = 240;

//Shrink it
alarm[0] = shrink_time + 30;
alarm[1] = shrink_time;
alarm[2] = 1;