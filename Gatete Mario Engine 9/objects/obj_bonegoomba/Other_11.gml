/// @description Custom Stomp script
	
//Play 'Crumble' sound
audio_play_sound(snd_crumble, 0, false);
	
#region SHARDS
	
	shard = instance_create_depth(x, y + 8, -2, obj_shard);
	with (shard) {

		//Set sprite
		sprite_index = spr_bonegoomba_shard;
		image_speed = 0;
		image_index = 3;
	
		//Set motion
		motion_set(45, 6);
	}

	shard = instance_create_depth(x, y + 8, -2, obj_shard);
	with (shard) {

		//Set sprite
		sprite_index = spr_bonegoomba_shard;
		image_speed = 0;
		image_index = 1;
	
		//Set motion
		motion_set(60, 6);
	}

	shard = instance_create_depth(x, y + 8, -2, obj_shard);
	with (shard) {

		//Set sprite
		sprite_index = spr_bonegoomba_shard;
		image_speed = 0;
		image_index = 0;
	
		//Set motion
		motion_set(120, 6);
	}

	shard = instance_create_depth(x, y + 8, -2, obj_shard);
	with (shard) {

		//Set sprite
		sprite_index = spr_bonegoomba_shard;
		image_speed = 0;
		image_index = 2;
	
		//Set motion
		motion_set(135, 6);
	}	
#endregion
	
//Turn into a pancake
with (instance_create_depth(x, y+1, -6, obj_stomped)) {

	sprite_index = spr_bonegoomba_sq;
}
	
//Destroy
instance_destroy();