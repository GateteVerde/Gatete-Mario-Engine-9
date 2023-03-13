/// @description Damage Mario

//If Mario is not invulnerable
if (invulnerable == false) {
	
	//Give temporary invincibility
	event_user(7);

	//If Mario still has HP left
	if (hp > 1) {

		//Play 'Damage' sound
		audio_play_sound(snd_damage, 0, false);
		
		//Decrement hp
		hp--;
	}

	//Otherwise, explode the plane
	else {

		//Create explosion
		instance_create_depth(x, y, -6, obj_explosion);
	
		//Create Dead Mario
		with (instance_create_depth(x, y, -5, obj_mario_dead)) {
	
			sprite_index = spr_mario_dead_big;
		}
	
		//Destroy
		instance_destroy();
	}
}