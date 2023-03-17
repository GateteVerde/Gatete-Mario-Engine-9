/// @description It's a me, Mario but in a plane/submarine

//Inherit the parent event
event_inherited();

//Hp
hp = 3;

//Delay
delay = 0;

//Disable all mounts
global.mount = 0;

//Force shmup mode on levelcontroller
with (obj_levelcontrol) shmup_mode = 1;

//Delay autoscroll
alarm[11] = 1;