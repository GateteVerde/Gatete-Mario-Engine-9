/// @description Create fully grown yoshi

with (instance_create_depth(x, y, -2, obj_yoshi_abandon)) {

	colour = other.colour
	yspeed = -1.5;
}

//Destroy
instance_destroy();