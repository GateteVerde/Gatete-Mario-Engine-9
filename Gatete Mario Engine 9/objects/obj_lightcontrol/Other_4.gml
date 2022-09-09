/// @description Generate Disco lights if allowed

//If this object is set on Disco mode
if (disco == true) {

	repeat (10) {
		
		instance_create_layer(random_range(32, room_width-32), random_range(32, room_height-32), "Main", obj_light_funky);
	}
}