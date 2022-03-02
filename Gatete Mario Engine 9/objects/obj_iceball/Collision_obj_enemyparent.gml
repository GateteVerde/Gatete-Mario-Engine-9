/// @description Turn into Ice

//If the enemy is vulnerable
if (other.vulnerable < 2) {
	
	//If the enemy has a width and a height of over 48 pixels, do not freeze
	if (sprite_width > 48)
	&& (sprite_height > 48) {
	
		event_user(0);
		exit;
	}
	
	//Play 'Freeze' sound
	audio_play_sound(snd_freeze, 0, false);
	
	//Create a frozen enemy
	frozen = instance_create_depth(other.x, other.y, -2, obj_enemy_frozen);
	
	//Hereby sprite
	frozen.sprite_index = (other.freeze_sprite != -1) ? other.freeze_sprite : other.sprite_index;
	
	//Hereby frame
	frozen.image_index = other.image_index;
	
	//Hereby facing direction
	frozen.xscale = other.xscale;
	
	//Hereby object
	frozen.ret = (other.freeze_object != -1) ? other.freeze_object : other.object_index;
	
	//Destroy
	with (other) instance_destroy();
}

//Destroy this projectile
if (other.vulnerable < 100)
	event_user(0);