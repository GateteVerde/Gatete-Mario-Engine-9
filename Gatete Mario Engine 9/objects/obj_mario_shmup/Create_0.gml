/// @description It's a me, Mario but in a plane/submarine

//Inherit the parent event
event_inherited();

//Delay
delay = 0;

//Disable all mounts
global.mount = 0;

//Force 'Super' Powerup if Mario is above big (Affects 'Tiny' powerup)
if (global.powerup > cs_big) then global.powerup = cs_big;

//Force shmup mode on levelcontroller
with (obj_levelcontrol) shmup_mode = 1;

//Delay autoscroll
alarm[11] = 1;