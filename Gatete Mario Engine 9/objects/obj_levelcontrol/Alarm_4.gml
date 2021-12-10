/// @description Kill Mario

//Reset up the timer
global.time = 0;

//Kill the player
instance_create_layer(obj_mario.x, obj_mario.y, "Main", obj_mario_dead);
with (obj_mario) instance_destroy();
exit;