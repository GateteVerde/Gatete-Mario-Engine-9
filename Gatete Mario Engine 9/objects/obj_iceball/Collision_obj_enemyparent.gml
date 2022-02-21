/// @description Turn into Ice

//If the enemy is vulnerable
if (other.vulnerable < 2) {
	
	//Play 'Freeze' sound
	audio_play_sound(snd_freeze, 0, false);
	
	//Create a frozen enemy
	frozen = instance_create_depth(other.x, other.y, -2, obj_enemy_frozen);
	
	//Hereby sprite
	frozen.sprite_index = other.sprite_index;
	
	//Hereby frame
	frozen.image_index = other.image_index;
	
	//Hereby object
	frozen.ret = other.object_index;
	
	//Destroy
	with (other) instance_destroy();
}

//Destroy this projectile
if (other.vulnerable < 100)
	event_user(0);