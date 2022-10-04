/// @description Trolloomba logic

//Inherit the parent event
event_inherited();

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0);
if (mario) {
	
	//Create explosion
	instance_create_layer(x, y, "Main", obj_explosion_lite);

	//Insta-Kill Mario
	with (mario) {
	
		//Create death object
		instance_create_depth(x, y, -5, obj_mario_dead);
		instance_destroy();
	}
	
	//Destroy
	instance_destroy();
}

//Set the facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;