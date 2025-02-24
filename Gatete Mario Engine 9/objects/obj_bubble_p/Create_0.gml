/// @description A bubble blown by Mario

//Inherit event from parent
event_inherited();

//Set the vertical motion
yspeed = -0.25;

//Scale
scale = 0.1;

//Whether this bubble scaled enough
ready = 0;

//Whether this bubble has captured an enemy
capture = false;

//Enemy sprite
enemy_spr = noone;
enemy_scale = 1;
enemy_angle = 0;