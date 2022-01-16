/// @description End cannon mode

if (cannon) {

	//Create Mario
	mario = instance_create_layer(x, y, "Main", obj_mario);
	with (mario) {
	
		//Hereby Mario's vertical speed
		yspeed = other.vspeed;
		
		//Set jumping state
		state = playerstate.jump;
		
		//Set facing direction
		xscale = other.image_xscale;
	}
	
	//Destroy
	instance_destroy();
}