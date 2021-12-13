/// @description Kill Mario

//Create 'Time Up!' sign
instance_create_depth(0, 0, -101, obj_timeup);

//Reset up the timer
global.time = 0;

//Kill the player
instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_mario_dead);
with (obj_mario) instance_destroy();
exit;