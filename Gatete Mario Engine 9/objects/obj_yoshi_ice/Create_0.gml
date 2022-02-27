/// @description Ice spitten by Yoshi

//Inherit the parent event
event_inherited();

//Animate
image_speed = 0.3;

//Set the horizontal speed
xspeed = 3*sign(obj_mario.xscale);

//Set parameters
alarm[0] = 2;

//Leave trail
alarm[1] = 1;

//Destroy
alarm[2] = 42;