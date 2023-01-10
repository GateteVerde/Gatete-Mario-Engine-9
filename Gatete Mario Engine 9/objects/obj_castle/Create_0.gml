/// @description End of level Castle

//Set up sprite
sprite_index = (instance_exists(obj_flagpole_secret)) ? spr_castle_secret : spr_castle;

//Do not animate
image_speed = 0;
image_index = 0;

//Depth
depth = 450;

//Create front part
with (instance_create_depth(x, y, -6, obj_castle_front))
	sprite_index = other.sprite_index;