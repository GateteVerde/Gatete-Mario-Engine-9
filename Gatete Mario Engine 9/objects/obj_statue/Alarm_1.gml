/// @description End statue morph

//With Mario
with (obj_mario) {

	//Play 'Transform' sound
	audio_play_sound(snd_transform, 0, false);
	
	//Start transforming sequence
	with (instance_create_depth(x, y, -5, obj_mario_transform)) {
	
		sequence = 4;
	}
	
	//Make Mario vulnerable
	invulnerable = 0;
	
	//Enable controls
	enable_control = true;
}

//Owner reference
owner.spin = noone;	

//Destroy
instance_destroy();