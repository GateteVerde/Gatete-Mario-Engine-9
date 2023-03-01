/// @description Spit fireballs

//Set the spitting sprite
sprite_index = spr_pipelotus;

//Animate
image_speed = 0;
image_index = 0;

//Go down pipe
alarm[3] = 60;

//Spit fireballs
with (instance_create_depth(x, y-8, -2, obj_lotusball)) {
	
    motion_set(30, 1);
	rinka = other.rinka;
}
with (instance_create_depth(x, y-8, -2, obj_lotusball)) {
	
    motion_set(60, 0.75);
	rinka = other.rinka;
}
with (instance_create_depth(x, y-8, -2, obj_lotusball)) {
	
    motion_set(120, 0.75);
	rinka = other.rinka;
}
with (instance_create_depth(x, y-8, -2, obj_lotusball)) {
	
    motion_set(150, 1);
	rinka = other.rinka;
}