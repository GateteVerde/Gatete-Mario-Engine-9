/// @description Hurt Mario

//If Mario is not invulnerable
if (invulnerable == false) {

	//If Mario still has hits left
	if (hits > 1) {

		//Give Mario temporary invincibility
		event_user(7);
	
		//Play 'Hit' sound
		audio_play_sound(snd_damage, 0, false);
	
		//Decrement hits
		hits--;
	}

	//Otherwise, blow up
	else {

		//Create explosion
		instance_create_depth(x, y, -6, obj_explosion);
	
		//Create dead object
		with (instance_create_depth(x, y, -5, obj_mario_dead)) {
		
			sprite_index = spr_mario_dead_big;
		}
	
		//Destroy
		instance_destroy();
		exit;
	}
}