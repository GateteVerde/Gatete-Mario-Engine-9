/// @description Lakitu Cloud

//Max speed
spd_max = 1;

//Horizontal scale
xscale = 1;

//Whether the player is on the cloud
player_on = false;

//Whether the player can ride this cloud
can_on = true;

//Set destroy timers
set = false;

//Create a fake semisolid
mytop = instance_create_depth(x-8, y+8, 1000, obj_semisolid);

//Leave trail
alarm[3] = 4;
