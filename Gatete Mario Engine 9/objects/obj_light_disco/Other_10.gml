/// @description Turn light ON or OFF

//Animate
image_speed = !image_speed;

//If the disco ball is animating
if (image_speed == 1) {

	if (mylight == noone) {
	
		mylight = instance_create_layer(x, y, "Main", obj_light_disco_ext);
		with (mylight)
			parent = other.id;
	}
}

//Otherwise, destroy the light
else {

	if (mylight != noone) {
	
		with (mylight) instance_destroy();
		mylight = noone;
	}
}