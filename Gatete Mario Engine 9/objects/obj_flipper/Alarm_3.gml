/// @description Create a solid or semisolid

//If the flipper is facing right
if (image_angle == 0) {

	mysolid = instance_create_layer(x-16, y-32, "Main", obj_solid);
	mysolid.image_yscale = 4;
}

//Otherwise, if the flipper is facing up
else if (image_angle == 90) {

	mysolid = instance_create_layer(x-32, y, "Main", obj_solid);
	mysolid.image_xscale = 4;
}

//Otherwise, if the flipper is facing left
else if (image_angle == 180) {

	mysolid = instance_create_layer(x, y-32, "Main", obj_solid);
	mysolid.image_yscale = 4;
}

//Otherwise, if the flipper is facing down
else if ((image_angle == -90) || (image_angle == 270)) {

	mysolid = instance_create_layer(x-32, y-16, "Main", obj_solid);
	mysolid.image_xscale = 4;
}