/// @description Custom stomp event

//Temp variable
var a = 0;

//Repeat 8 times
repeat (8) {
	
	//Create smoke effect
	with (instance_create_depth(x, y + 8, -4, obj_smoke)) {

		sprite_index = spr_smoke;
		image_speed *= 2;
		motion_set(a, 1.5);
	}
	
	//Set direction
	a += 45;
}

//Destroy
instance_destroy();
