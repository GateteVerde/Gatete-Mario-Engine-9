/// @description Throwable brick

//Inherit event from parent
event_inherited();

//Shard sprite
shard_sprite = spr_shard_brick_blue;

//Whether the object is being held
held = 0;

//Whether the object has been kicked
ready = 0;

//Number of kills
hitcombo = 0;

//Check
check = 0;

//Whether the brick will harm the player
hurtplayer = 0;

//Slowdown animation
alarm[0] = 480;

//Destroy after 600 steps
alarm[1] = 600;
